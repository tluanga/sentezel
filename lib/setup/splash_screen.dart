import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/constants/route_constant.dart';

class SplashScreen extends HookConsumerWidget {
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
      Navigator.of(context).pushReplacementNamed(RouteConstant.home);
    }

    startTime() async {
      var _duration = new Duration(seconds: 5);
      return new Timer(_duration, navigationPage);
    }

    useEffect(
      () {
        startTime();
      },
      [],
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/sentezel_logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('-assets/images/mzu_inc_logo.png'),
              ),
            ],
          ),
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
