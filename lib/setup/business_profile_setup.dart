import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/business_profile/business_profile_controller.dart';
import 'package:sentezel/settings/business_profile/data/business_type_enum.dart';

class BusinessProfileSetup extends HookConsumerWidget {
  const BusinessProfileSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _type = useState(BusinessType.mahniSiamZuar);
    return Material(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Please Enter Your Business Name'),
            onChanged: (value) {
              ref.read(businessProfileControllerProvider.notifier).name = value;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            padding: const EdgeInsets.symmetric(
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
                    value: BusinessType.mahniSiamZuar,
                    onChanged: (value) {
                      _type.value = BusinessType.mahniSiamZuar;
                    },
                    groupValue: _type.value,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(0),
                  child: ListTile(
                    title: const Text('Indirect'),
                    trailing: Radio(
                      value: BusinessType.miSiamsaZuar,
                      onChanged: (value) {
                        _type.value = BusinessType.miSiamsaZuar;
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
    );
  }
}
