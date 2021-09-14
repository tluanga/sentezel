import 'package:flutter/material.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterType_enum.dart';

class LedgerMasterTypeSelectWidget extends StatefulWidget {
  final LedgerMasterType ledgerMasterType;
  const LedgerMasterTypeSelectWidget({
    Key? key,
    this.ledgerMasterType = LedgerMasterType.direct,
  }) : super(key: key);

  @override
  _LedgerMasterTypeSelectWidgetState createState() =>
      _LedgerMasterTypeSelectWidgetState();
}

class _LedgerMasterTypeSelectWidgetState
    extends State<LedgerMasterTypeSelectWidget> {
  LedgerMasterType _type = LedgerMasterType.direct;
  @override
  void initState() {
    _type = widget.ledgerMasterType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text('Direct'),
            trailing: Radio(
              value: LedgerMasterType.direct,
              onChanged: (value) {
                setState(() {
                  _type = LedgerMasterType.direct;
                });
              },
              groupValue: _type,
            ),
          ),
          ListTile(
            title: Text('Indirect'),
            trailing: Radio(
              value: LedgerMasterType.indirect,
              onChanged: (value) {
                setState(() {
                  _type = LedgerMasterType.indirect;
                });
              },
              groupValue: _type,
            ),
          ),
        ],
      ),
    );
  }
}
