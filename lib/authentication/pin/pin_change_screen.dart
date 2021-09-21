import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/authentication/pin/pin_controller.dart';
import 'package:sentezel/common/ui/widget/elevated_container.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';

class PinChangeScreen extends HookConsumerWidget {
  const PinChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pinControllerProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Material(
        child: SafeArea(
          child: Column(
            children: [
              TopBarWidget(
                  title: 'Pin Change',
                  onClose: () {
                    Navigator.pop(context);
                  }),
              const Spacer(flex: 1),
              const Text('Change Your Pin'),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ElevatedContainer(
                      outerBottomPadding: 10,
                      innerHorzPadding: 15,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: ' Enter Pin', border: InputBorder.none),
                        onChanged: (value) {
                          state.pin = int.parse(value);
                        },
                      ),
                    ),
                    ElevatedContainer(
                      outerBottomPadding: 10,
                      innerHorzPadding: 15,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Re Enter Pin',
                            border: InputBorder.none),
                        onChanged: (value) {
                          // ref.read(pinControllerProvider.notifier).checkPassPhrase(value);
                        },
                      ),
                    ),
                    ElevatedContainer(
                      outerBottomPadding: 10,
                      innerHorzPadding: 15,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Pass Phrase', border: InputBorder.none),
                        onChanged: (value) {
                          state.passPhrase = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(
                flex: 3,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: MaterialButton(
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.blue,
                  // ONPRESSED
                  onPressed: () {},
                  child: Center(
                      child: Text(
                    'Submit',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
