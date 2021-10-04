import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/common/enums/status_enum.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/widget/top_bar_for_bottom_sheet_widget.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
import 'package:sentezel/settings/transactionCategory/new_transaction_category/new_transaction_category_controller.dart';
import 'package:sentezel/settings/transactionCategory/new_transaction_category/new_transaction_ledger_select_controller.dart';
import 'package:sentezel/settings/transactionCategory/new_transaction_category/update_transaction_category/update_transaction_category_controller.dart';

class NewTransactionLedgerSelectWidget extends HookConsumerWidget {
  final bool hastransactionCategoryData;
  const NewTransactionLedgerSelectWidget(
      {Key? key, required this.hastransactionCategoryData})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref
          .read(newTransactionLedgerSelectControllerProvider.notifier)
          .loadData();
    }, []);
    return Material(
      child: Column(
        children: [
          TopBarForBottomSheetWidget(
            label: 'Select Ledger',
            onExit: () {
              Navigator.pop(context);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Select Ledger'),
          ),
          ref.read(newTransactionLedgerSelectControllerProvider).when(
              data: (data) {
            return _list(context, data, ref);
          }, loading: () {
            return const CircularProgressIndicator();
          }, error: (error, stack) {
            return const Text('Error');
          })
        ],
      ),
    );
  }

  _list(BuildContext context, List<LedgerMaster> list, WidgetRef ref) {
    list.sort((a, b) => a.name.compareTo(b.name));

    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _listItem(context, list[index], ref);
        },
      ),
    );
  }

  _listItem(BuildContext context, LedgerMaster ledgerMaster, WidgetRef ref) {
    Color _color;

    switch (ledgerMaster.type) {
      case LedgerMasterType.direct:
        _color = Palette.color1;

        break;
      case LedgerMasterType.indirect:
        _color = Palette.color2;
        break;
      case LedgerMasterType.party:
        _color = Palette.color3;
        break;
      default:
        _color = Palette.color4;
        break;
    }
    return GestureDetector(
      onTap: () {
        // has transactionCategory data = true means it is update
        if (hastransactionCategoryData == true) {
          ref
              .read(updateTransactionCategoryControllerProvider.notifier)
              .ledger = ledgerMaster.id;
        }
        // has transactionCategory data = false means it is new transaction category
        if (hastransactionCategoryData == false) {
          ref.read(newTransactionCategoryControllerProvider.notifier).ledger =
              ledgerMaster.id;
        }
        Navigator.of(context).pop();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  ledgerMaster.getInitialLetter(),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.74,
                  child: Center(
                    child: Text(
                      ledgerMaster.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.74,
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: Center(
                    child: Text(
                      ledgerMaster.description != ledgerMaster.name
                          ? ledgerMaster.description
                          : '',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.74,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        toBeginningOfSentenceCase(
                          EnumToString.convertToString(ledgerMaster.type),
                        )!,
                      ),
                      Container(
                        child: ledgerMaster.status == Status.active
                            ? const Text(
                                'Active',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              )
                            : const Text(
                                'In-Active',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
