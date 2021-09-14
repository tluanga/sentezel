import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sentezel/settings/business_profile/business_type_enum.dart';

class BusinessProfileSetup extends HookConsumerWidget {
  const BusinessProfileSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _businessType = useState(BusinessType.mahniSiamZuar);
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Business Name'),
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
                        title: Text('Direct'),
                        trailing: Radio(
                          value: BusinessType.midangSiamZuar,
                          onChanged: (value) {
                            print('before change value ${_businessType.value}');
                            _businessType.value = BusinessType.midangSiamZuar;
                            print('Change value ${_businessType.value}');
                          },
                          groupValue: _businessType.value,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(0),
                        child: ListTile(
                          title: Text('Indirect'),
                          trailing: Radio(
                            value: BusinessType.mahniSiamZuar,
                            onChanged: (value) {
                              print(
                                  'before change value ${_businessType.value}');
                              _businessType.value = BusinessType.mahniSiamZuar;
                              print('Change value ${_businessType.value}');
                            },
                            groupValue: _businessType.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
