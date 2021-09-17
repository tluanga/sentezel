import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/constants/route_constant.dart';
import 'package:sentezel/setup/app_controller.dart';

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
    final state = ref.read(appControllerProvider);

    void navigationPage() async {
      if (state.businessProfileIsSetup) {
        Navigator.of(context).pushReplacementNamed(RouteConstant.home);
      } else {
        Navigator.of(context)
            .pushReplacementNamed(RouteConstant.businessProfileSetup);
      }
    }

    startTime() async {
      var _duration = const Duration(seconds: 5);
      return Timer(_duration, navigationPage);
    }

    useEffect(
      () {
        startTime();
      },
      [],
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/sentezel_logo.png'),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Image.asset('-assets/images/mzu_inc_logo.png'),
            // ),
          ],
        ),
      ),
    );
  }
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
