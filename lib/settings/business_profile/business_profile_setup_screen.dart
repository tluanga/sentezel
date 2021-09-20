import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/constants/route_constant.dart';
import 'package:sentezel/settings/business_profile/business_profile_controller.dart';

import 'package:sentezel/settings/business_profile/data/business_type_enum.dart';

class BusinessProfileSetupScreen extends HookConsumerWidget {
  const BusinessProfileSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(businessProfileControllerProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Material(
        child: SafeArea(
          child: SizedBox(
            child: state.when(data: (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    setupIcon(),
                    const Spacer(),
                    Container(
                      height: 53,
                      decoration: BoxDecoration(
                          color: Colors.white, // Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.badge_rounded,
                            color: Color(0xff757575),
                            size: 27,
                          ),
                          filled: true,
                          fillColor: Colors.white, // Colors.grey.shade200,
                          labelText: 'name',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
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
                    Container(
                      height: 53,
                      decoration: BoxDecoration(
                          color: Colors.white, // Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.description_rounded,
                            color: Color(0xff757575),
                            size: 27,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'descriptiption',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onChanged: (value) {
                          ref
                              .read(businessProfileControllerProvider.notifier)
                              .description = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, // Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 8, top: 5),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.account_box_rounded,
                                  color: Color(0xff757575),
                                  size: 27,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Ledger Master Type',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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
                          ListTile(
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
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, // Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                      child: MaterialButton(
                        elevation: 50,
                        height: 50,
                        minWidth: 180,
                        color: Colors.grey[900], // Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          ref
                              .read(businessProfileControllerProvider.notifier)
                              .set();
                          Navigator.of(context)
                              .pushReplacementNamed(RouteConstant.pinSetup);
                        },
                        child: Text(
                          'Submit',
                          style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              );
            }, loading: () {
              return const Center(child: CircularProgressIndicator());
            }, error: (error, stack) {
              return const Text('Error');
            }),
          ),
        ),
      ),
    );
  }

  Widget setupIcon() => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            const Icon(
              CupertinoIcons.book_circle,
              size: 50,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Business Profile Setup",
              style: GoogleFonts.aBeeZee(
                  fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
