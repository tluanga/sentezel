import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/common/constants/ui_constant.dart';
import 'package:sentezel/common/enums/activeInActive_enum.dart';
import 'package:sentezel/common/enums/ledgerMasterType_enum.dart';
import 'package:sentezel/common/ui/widget/floatingActionButton_widget.dart';
import 'package:sentezel/common/ui/widget/topBar_widget.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_controller.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_model.dart';
import 'package:sentezel/settings/ledgerMaster/newLedgerMaster_screen.dart';

class LedgerMasterScreen extends HookConsumerWidget {
  const LedgerMasterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    final list = ref.watch(ledgerMasterListControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              TopBarWidget(
                title: 'Ledger Master',
              ),
              //------Searching Ledger Master and filtration will be done
              // based in input
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  decoration: InputDecoration(labelText: 'Search'),
                ),
              ),
              _list(context, list),
            ],
          ),
        ),
      ),
      floatingActionButton: SentezelFloatingActionButton(
        onPressed: () {
          showCupertinoModalBottomSheet(
            expand: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => NewLedgerMasterScreen(),
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
        _color = UiConstant.color1;

        break;
      case LedgerMasterType.indirect:
        _color = UiConstant.color2;
        break;
      case LedgerMasterType.party:
        _color = UiConstant.color3;
        break;
      default:
        _color = UiConstant.color4;
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
                  ledgerMaster.getInitialLetter(),
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: ledgerMaster.description != null
                  ? MainAxisAlignment.spaceAround
                  : MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.74,
                  child: Center(
                    child: Text(
                      ledgerMaster.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.74,
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: Center(
                    child: Text(
                      ledgerMaster.description != null
                          ? ledgerMaster.description != ledgerMaster.name
                              ? ledgerMaster.description!
                              : ''
                          : '',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.74,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          toBeginningOfSentenceCase(
                            EnumToString.convertToString(ledgerMaster.type),
                          )!,
                        ),
                      ),
                      Container(
                        child: ledgerMaster.status == ActiveInActive.active
                            ? Text(
                                'Active',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              )
                            : Text(
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
