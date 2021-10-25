import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/business_profile/data/business_type_enum.dart';

class BusinessProfileSetup extends HookConsumerWidget {
  const BusinessProfileSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _businessType = useState(BusinessType.mahniSiamZuar);
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Business Name'),
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
                        'Ledger Master Type',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('Direct'),
                      trailing: Radio(
                        value: BusinessType.miSiamsaZuar,
                        onChanged: (value) {
                          _businessType.value = BusinessType.miSiamsaZuar;
                        },
                        groupValue: _businessType.value,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(0),
                      child: ListTile(
                        title: const Text('Indirect'),
                        trailing: Radio(
                          value: BusinessType.mahniSiamZuar,
                          onChanged: (value) {
                            _businessType.value = BusinessType.mahniSiamZuar;
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
        ],
      ),
    );
  }
}

//
