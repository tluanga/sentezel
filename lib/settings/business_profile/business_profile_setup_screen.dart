import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/constants/route_constant.dart';
import 'package:sentezel/common/ui/widget/elevated_container.dart';
import 'package:sentezel/common/ui/widget/top_bar_for_bottom_sheet_widget.dart';
import 'package:sentezel/settings/business_profile/business_profile_controller.dart';

import 'package:sentezel/settings/business_profile/data/business_type_enum.dart';

class BusinessProfileSetupScreen extends HookConsumerWidget {
  const BusinessProfileSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(businessProfileControllerProvider);

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Material(
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
                    ElevatedContainer(
                      outerBottomPadding: 10,
                      innerHorzPadding: 0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.badge_rounded,
                            color: Colors.blue, // Color(0xff0d47a1),
                            size: 27,
                          ),
                          filled: true,
                          fillColor: Colors.white, // Colors.grey.shade200,
                          labelText: 'Name',
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
                    ElevatedContainer(
                      outerBottomPadding: 10,
                      innerHorzPadding: 0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.description_rounded,
                            color: Colors.blue,
                            size: 27,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Description',
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
                    ElevatedContainer(
                      outerBottomPadding: 10,
                      innerHorzPadding: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 8, top: 8, bottom: 4),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.manage_accounts_rounded,
                                  color: Colors.blue, //Color(0xff757575),
                                  size: 27,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Ledger Master Type',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff424242)),
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            horizontalTitleGap: 8,
                            minLeadingWidth: 8,
                            leading: const Icon(
                              Icons.account_tree_rounded,
                              size: 23,
                              color: Colors.blue,
                            ),
                            title: Text(
                              'Mahni Siam Zuar',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 15, color: const Color(0xff424242)),
                            ),
                            trailing: Radio(
                                activeColor: const Color(0xff0d47a1),
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
                            horizontalTitleGap: 8,
                            minLeadingWidth: 8,
                            leading: const Icon(
                              Icons.account_tree_rounded,
                              size: 23,
                              color: Colors.blue,
                            ),
                            title: Text(
                              'Mi Siam Sa Zuar',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 15, color: const Color(0xff424242)),
                            ),
                            trailing: Radio(
                              activeColor: const Color(0xff0d47a1),
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
                          color:
                              const Color(0xff0d47a1), // Colors.grey.shade200,
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
                        color: Colors.blue, // Color(0xff0d47a1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {
                          List<String> _errorMessages = [];
                          if (state.data!.value.name.isEmpty) {
                            _errorMessages
                                .add('Khawngaihin Sumdawnna hming dah rawh');
                          }
                          if (state.data!.value.description.isEmpty) {
                            _errorMessages
                                .add('Khawngaihin description dah rawh');
                          }
                          // validation error Sheet
                          if (_errorMessages.isEmpty) {
                            FocusScope.of(context).unfocus();
                            ref
                                .read(
                                    businessProfileControllerProvider.notifier)
                                .save();
                            Navigator.of(context)
                                .pushReplacementNamed(RouteConstant.pinSetup);
                          } else {
                            _validationErrorSheet(context, _errorMessages);
                          }
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
              Icons.account_circle_sharp,
              size: 60,
              color: Colors.blue, //(0xff0d47a1),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Business Profile Setup",
              style: GoogleFonts.aBeeZee(
                  color: Colors.blue, //Color(0xff0d47a1),
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}

_validationErrorSheet(BuildContext context, List<String> errorMessages) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return

            //  Material(
            //   child: SafeArea(
            //       child: ListView.builder(
            //           itemCount: errorMessages.length,
            //           itemBuilder: (context, index) {
            //             return Text(errorMessages[index]);
            //           })),
            // );
            Container(
          height: MediaQuery.of(context).size.height * 0.35,
          child: Material(
            child: SafeArea(
                child: Column(
              children: [
                TopBarForBottomSheetWidget(
                    label: 'Validation Error',
                    onExit: () {
                      Navigator.pop(context);
                    }),
                Expanded(
                  child: ListView.builder(
                      itemCount: errorMessages.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      CupertinoIcons.xmark_octagon,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      child: Center(
                                        child: Text(
                                          errorMessages[index],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                        // Text(_errorMessages[index]);
                      }),
                ),
              ],
            )),
          ),
        );
      });
}
