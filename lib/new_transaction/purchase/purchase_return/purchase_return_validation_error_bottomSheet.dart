// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/top_bar_for_bottom_sheet_widget.dart';

class PurchaseReturnValidationErrorBottomSheet extends HookConsumerWidget {
  final List<String> validationErrorMessages;
  const PurchaseReturnValidationErrorBottomSheet(
      {Key? key, required this.validationErrorMessages})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          (validationErrorMessages.length / 6),
      child: Column(
        children: [
          TopBarForBottomSheetWidget(
              label: 'Validation Error',
              onExit: () {
                Navigator.pop(context);
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height *
                (validationErrorMessages.length / 12),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: validationErrorMessages.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
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
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: Center(
                                child: Text(
                                  validationErrorMessages[index],
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
              },
            ),
          )
        ],
      ),
    );
  }
}
