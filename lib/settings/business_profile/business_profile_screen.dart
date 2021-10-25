import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/container_assets.dart';
import 'package:sentezel/common/ui/widget/container_business.dart';
import 'package:sentezel/common/ui/widget/top_bar_with_save_widget.dart';
import 'package:sentezel/settings/business_profile/business_profile_controller.dart';
import 'package:sentezel/settings/business_profile/data/business_type_enum.dart';

class BusinessProfileSceen extends HookConsumerWidget {
  const BusinessProfileSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _businessType = useState<BusinessType>(
      BusinessType.mahniSiamZuar,
    );
    useEffect(() {
      ref.read(businessProfileControllerProvider.notifier).loadData();
    }, []);
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            TopBarWithSaveWidget(
              title: 'Business Profile',
              onSave: () {
                ref.read(businessProfileControllerProvider.notifier).save();
                Navigator.pop(context);
              },
              onCancel: () {
                Navigator.pop(context);
              },
            ),
            ref.read(businessProfileControllerProvider).when(
              data: (data) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    ContainerBusiness(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Business Name',
                            border: InputBorder.none),
                        initialValue: data.name,
                        onChanged: (value) {
                          ref
                              .read(businessProfileControllerProvider.notifier)
                              .name = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ContainerBusiness(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Description',
                        ),
                        initialValue: data.description,
                        onChanged: (value) {
                          ref
                              .read(businessProfileControllerProvider.notifier)
                              .description = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ContainerBusiness(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            'Ledger Master Type',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.only(left: 16),
                          title: const Text('Mahni Siam Zuar'),
                          trailing: Radio(
                            value: BusinessType.mahniSiamZuar,
                            onChanged: (value) {
                              // _type.value = LedgerMasterType.direct;
                              ref
                                  .read(businessProfileControllerProvider
                                      .notifier)
                                  .type = BusinessType.mahniSiamZuar;
                            },
                            groupValue: data.type,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(0),
                          child: ListTile(
                            contentPadding: const EdgeInsets.only(left: 16),
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
                      ],
                    ))
                  ]),
                );
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              error: (error, statck) {
                return Text(error.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
