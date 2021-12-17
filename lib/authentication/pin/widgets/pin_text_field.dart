import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

final fourdigitPinProvider = StateProvider<bool>((ref) => true);
final confirmPinProvider = StateProvider<bool>((ref) => false);

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
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      print(ref.watch(fourdigitPinProvider).state);
      return SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ref.watch(fourdigitPinProvider).state
                    ? GestureDetector(
                        onTap: () {
                          ref.read(fourdigitPinProvider.notifier).state = false;
                        },
                        child: const Icon(
                          CupertinoIcons.eye,
                          color: Colors.blue,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          ref.read(fourdigitPinProvider.notifier).state = true;
                        },
                        child: const Icon(
                          CupertinoIcons.eye_slash,
                          color: Colors.blue,
                        ),
                      ),
                // const Icon(
                //   Icons.pin,
                //   color: Colors.blue,
                // ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  title, // ṭext,
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                ),
                // const Spacer(),
                // const Icon(
                //   CupertinoIcons.eye,
                //   // color: Colors.blue,
                // ),
                // const SizedBox(
                //   width: 8,
                // ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: PinCodeTextField(
                obscureText: ref.watch(fourdigitPinProvider).state,
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
                  activeColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    });
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
