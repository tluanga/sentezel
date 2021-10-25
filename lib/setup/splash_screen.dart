import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/constants/route_constant.dart';
import 'package:sentezel/setup/app_controller.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  // startTime() async {
  //   var _duration = new Duration(seconds: 2);
  //   return new Timer(_duration, navigationPage);
  // }

  // void navigationPage() async {
  //   User user = await Provider.of<UserSetupProvider>(context, listen: false)
  //       .getUserData();
  //   if (user.fullName.isNotEmpty) {
  //     Navigator.of(context).pushReplacementNamed(Routes.login);
  //   } else {
  //     Navigator.of(context).pushReplacementNamed(Routes.userSetup);
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void navigationPage() async {
      final state = ref.watch(appControllerProvider);
      if (state.businessProfileIsSetup) {
        Navigator.of(context).pushReplacementNamed(RouteConstant.pinAuth);
      } else {
        Navigator.of(context)
            .pushReplacementNamed(RouteConstant.businessProfileSetup);
      }
    }

    startTime() async {
      var _duration = const Duration(seconds: 4);
      return Timer(_duration, navigationPage);
    }

    useEffect(
      () {
        ref.read(appControllerProvider.notifier).checkSetup();
        startTime();
      },
      [],
    );

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            widgetTitle(),
            const Spacer(),
            widgetSpinkit(),
          ],
        ),
      ),
    );
  }

  widgetTitle() => Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 200,
        child: Shimmer.fromColors(
            child: Center(
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
                child: AnimatedTextKit(
                  totalRepeatCount: 1,
                  pause: const Duration(microseconds: 0),
                  animatedTexts: [
                    WavyAnimatedText(
                      'Sentezel',
                      textStyle: GoogleFonts.aBeeZee(
                          fontSize: 45, fontWeight: FontWeight.bold),
                      speed: const Duration(milliseconds: 250),
                    ),
                  ],
                ),
              ),
            ),
            baseColor: const Color(
                0xff0d47a1), //Color( 0xff1565c0), // Color(0xff0d47a1), // Color(0xff193566), //Color(0xff263238),
            highlightColor: const Color(0xffd90368)),
      );
  widgetSpinkit() => const Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: SpinKitThreeBounce(
          size: 20,
          color: Color(0xff0d47a1),
        ),
      );
}






// class SplashScreen extends StatefulWidget {
//   SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   startTime() async {
//     var _duration = new Duration(seconds: 2);
//     return new Timer(_duration, navigationPage);
//   }

//   void navigationPage() async {
//     User user = await Provider.of<UserSetupProvider>(context, listen: false)
//         .getUserData();
//     if (user.fullName.isNotEmpty) {
//       Navigator.of(context).pushReplacementNamed(Routes.login);
//     } else {
//       Navigator.of(context).pushReplacementNamed(Routes.userSetup);
//     }
//   }

//   @override
//   void initState() {
//     Provider.of<UserSetupProvider>(context, listen: false).checkUserSetup();
//     startTime();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 200,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Image.asset('assets/images/splash.png'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
