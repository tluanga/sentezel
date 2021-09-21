import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String title;
  const PinTextField({
    Key? key,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.pin,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title, // ṭext,
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: PinCodeTextField(
              obscureText: true,
              keyboardType: TextInputType.number,
              appContext: context,
              length: 4,
              onChanged: (String value) {
                onChanged(value);
              },
              pinTheme: PinTheme(
                fieldHeight: 32,
                fieldWidth: 32,
                inactiveColor: Colors.grey,
                //activeColor: Colors.grey[800],
              ),
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
