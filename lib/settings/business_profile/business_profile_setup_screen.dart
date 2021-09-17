import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/business_profile/business_profile_controller.dart';

import 'package:sentezel/settings/business_profile/data/business_type_enum.dart';

class BusinessProfileSetupScreen extends HookConsumerWidget {
  const BusinessProfileSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(businessProfileControllerProvider);

    return Material(
      child: SafeArea(
        child: SizedBox(
          child: state.when(data: (data) {
            return Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'name'),
                  onChanged: (value) {
                    ref.read(businessProfileControllerProvider.notifier).name =
                        value;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'descriptiption'),
                  onChanged: (value) {
                    ref
                        .read(businessProfileControllerProvider.notifier)
                        .description = value;
                  },
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
                        title: const Text('Mahni Siam Zuar'),
                        trailing: Radio(
                            value: BusinessType.mahniSiamZuar,
                            onChanged: (value) {
                              ref
                                  .read(businessProfileControllerProvider
                                      .notifier)
                                  .type = BusinessType.mahniSiamZuar;
                            },
                            groupValue: data.type),
                      ),
                      Container(
                        margin: const EdgeInsets.all(0),
                        child: ListTile(
                          title: const Text('Mi Siam Sa Zuar'),
                          trailing: Radio(
                            value: BusinessType.miSiamsaZuar,
                            onChanged: (value) {
                              ref
                                  .read(businessProfileControllerProvider
                                      .notifier)
                                  .type = BusinessType.miSiamsaZuar;
                            },
                            groupValue: data.type,
                          ),
                        ),
                      ),
                      Text('Submit Button'),
                    ],
                  ),
                ),
              ],
            );
          }, loading: () {
            return const Center(child: CircularProgressIndicator());
          }, error: (error, stack) {
            return const Text('Error');
          }),
        ),
      ),
    );
  }
}
