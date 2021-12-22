import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentezel/analytics/controller_provider.dart';

Widget analyticsAppBar() {
  return Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(ref.watch(periodController.notifier).state.toString(),
              style: GoogleFonts.archivo(
                  fontSize: 25, fontWeight: FontWeight.bold)),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.cancel_outlined,
                size: 35,
              )),
        ],
      );
    },
  );
}
