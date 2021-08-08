import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sentezel/settings/businessProfile/businessType_enum.dart';

class BusinessProfileSetupSceen extends HookWidget {
  const BusinessProfileSetupSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _businessType = useState<BusinessType>(
      BusinessType.mahniSiamZuar,
    );
    return Container(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Business Name',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Address',
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Ledger Master Type',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Mahni Siam Zuar'),
                  trailing: Radio(
                    value: BusinessType.mahniSiamZuar,
                    onChanged: (value) {
                      // _type.value = LedgerMasterType.direct;
                      _businessType.value = BusinessType.mahniSiamZuar;
                    },
                    groupValue: _businessType.value,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  child: ListTile(
                    title: Text('Mi Siam Sa Zuar'),
                    trailing: Radio(
                      value: BusinessType.midangSiamZuar,
                      onChanged: (value) {
                        _businessType.value = BusinessType.midangSiamZuar;
                      },
                      groupValue: _businessType.value,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
