import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/widget/topBarWithNewForBottomSheet_widget.dart';

purchaseOfAssetConfirmDialog(BuildContext context) {
  return Material(
    child: Container(
      child: Column(
        children: [
          TopBarWithNewForBottomSheetWidget(
              label: 'Please Confirm', onNew: () {})
        ],
      ),
    ),
  );
}
