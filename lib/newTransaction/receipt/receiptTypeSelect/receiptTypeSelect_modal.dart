import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/widget/topBarForBottomSheet_widget.dart';
import 'package:sentezel/newTransaction/receipt/receiptTypeSelect/receiptTypeSelect_controller.dart';
import 'package:sentezel/settings/transactionCategory/data/transactionCategory_model.dart';

class ReceiptTypeSelectModal extends HookConsumerWidget {
  final Function(TransactionCategory) onSelect;
  const ReceiptTypeSelectModal({Key? key, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(receiptTypeSelectControllerProvider);
    useEffect(() {
      ref.watch(receiptTypeSelectControllerProvider.notifier).loadData();
    }, []);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBarForBottomSheetWidget(
                label: 'Please Select Category',
                onExit: () {
                  Navigator.pop(context);
                }),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Search Ledger'),
                onChanged: (value) {
                  ref
                      .watch(receiptTypeSelectControllerProvider.notifier)
                      .loadData(
                        categoryName: value,
                      );
                },
              ),
            ),
            state.when(data: (data) {
              return _list(context, data);
            }, loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            }, error: (error, stack) {
              return Center(
                child: Text('Error'),
              );
            }),
          ],
        ),
      ),
    );
  }

  _list(context, data) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _listItem(
            context: context,
            item: data[index],
          );
        },
      ),
    );
  }

  _listItem(
      {required BuildContext context, required TransactionCategory item}) {
    Color _color = Palette.color3;

    _color = Palette.color1;

    return GestureDetector(
      onTap: () {
        this.onSelect(item);
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  item.getInitialLetter(),
                  style: TextStyle(
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.74,
                  child: Center(
                    child: Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    item.description,
                    overflow: TextOverflow.ellipsis,
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
