import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/common/enums/status_enum.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/widget/floating_action_button_widget.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_list_controller.dart';
import 'package:sentezel/settings/ledger_master/new_ledger_master_screen.dart';

class LedgerMasterScreen extends HookConsumerWidget {
  const LedgerMasterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(ledgerMasterListControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBarWidget(
              title: 'Ledger Master',
              onClose: () {
                Navigator.pop(context);
              },
            ),
            //------Searching Ledger Master and filtration will be done
            // based in input
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const TextField(
                decoration: InputDecoration(labelText: 'Search'),
              ),
            ),
            _list(context, list),
          ],
        ),
      ),
      floatingActionButton: SentezelFloatingActionButton(
        onPressed: () {
          showCupertinoModalBottomSheet(
            expand: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => const NewLedgerMasterScreen(),
          );
        },
      ),
    );
  }

  _list(BuildContext context, List<LedgerMaster> list) {
    list.sort((a, b) => a.name.compareTo(b.name));

    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _listItem(context, list[index]);
        },
      ),
    );
  }

  _listItem(BuildContext context, LedgerMaster ledgerMaster) {
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewLedgerMasterScreen(
              ledgerMaster: ledgerMaster,
            ),
          ),
        );
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
