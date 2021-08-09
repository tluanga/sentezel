import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/widget/topBarNewItem_widget.dart';
import 'package:sentezel/common/ui/widget/topBar_widget.dart';

class AssetPurchaseScreen extends StatelessWidget {
  const AssetPurchaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                TopBarNewItemWidget(title: 'New Asset Purchase', onSave: () {}),
                Text('DateSelection,'),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Text('Ba'),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                        ),
                        child: Text('Asset Select'),
                      ),
                      Container(
                        child: Text(
                          'Stool',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Search Asset'),
                    ),
                  ],
                ),
                Container(child: ListView.builder(itemCount: 10,itemBuilder: (context,index){
                  return()
                },),)
              ],
            ),
          ),
        ),
      ),
    );
  }
  _assetItem(BuildContext context, LedgerMaster ledgerMaster) {
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
