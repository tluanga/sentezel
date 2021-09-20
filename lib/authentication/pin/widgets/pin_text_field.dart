import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String title;
  const PinTextField({
    Key? key,
    required this.textEditingController,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title, // ṭext,
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          PinCodeTextField(
            controller: textEditingController,
            obscureText: true,
            keyboardType: TextInputType.number,
            appContext: context,
            length: 4,
            onChanged: (String value) {},
            pinTheme: PinTheme(
              fieldHeight: 32,
              fieldWidth: 32,
              inactiveColor: Colors.grey,
              activeColor: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}

// class PinTextField extends ConsumerWidget {
//   final TextEditingController textEditingController;
//   final String text;
//   PinTextField(this.textEditingController, this.text, {Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     String errMessage = watch(setpinMessageNotifierProvider).errMessage;
//     return SizedBox(
//       width: 250,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 text, // ṭext,
//                 style: GoogleFonts.aBeeZee(
//                   color: Colors.black87,
//                   fontSize: 13,
//                 ),
//               ),
//               Text(
//                 errMessage, // ṭext,
//                 style: GoogleFonts.aBeeZee(
//                   color: Colors.red,
//                   fontSize: 10,
//                 ),
//               ),
//             ],
//           ),
//           PinCodeTextField(
//             controller: textEditingController,
//             obscureText: true,
//             keyboardType: TextInputType.number,
//             appContext: context,
//             length: 4,
//             onChanged: (String value) {},
//             pinTheme: PinTheme(
//               fieldHeight: 32,
//               fieldWidth: 32,
//               inactiveColor: Colors.grey,
//               activeColor: Colors.grey[800],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
