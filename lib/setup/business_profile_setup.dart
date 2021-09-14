import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/business_profile/data/business_type_enum.dart';

class BusinessProfileSetup extends HookConsumerWidget {
  const BusinessProfileSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _type = useState(BusinessType.MahniSiamZuar);
    return Material(
      child: Container(
        child: Column(
          children: [
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Please Enter Your Business Name'),
            ),
            SizedBox(
              height: 10,
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Business Type',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Text('Image will be here'),
                    title: const Text('Direct'),
                    trailing: Radio(
                      value: BusinessType.MahniSiamZuar,
                      onChanged: (value) {
                        print('before change value ${_type.value}');
                        _type.value = BusinessType.MahniSiamZuar;
                        print('Change value ${_type.value}');
                      },
                      groupValue: _type.value,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(0),
                    child: ListTile(
                      title: Text('Indirect'),
                      trailing: Radio(
                        value: BusinessType.MiSiamsaZuar,
                        onChanged: (value) {
                          print('before change value ${_type.value}');
                          _type.value = BusinessType.MiSiamsaZuar;
                          print('Change value ${_type.value}');
                        },
                        groupValue: _type.value,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
