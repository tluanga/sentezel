import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => {
        Navigator.of(context).pushReplacementNamed(Routes.root),
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Image.asset('assets/images/sentezel_logo.png'),
                    Text(
                      'Sentezel',
                      style: TextStyle(fontSize: 23),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/mzu_inc_logo.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              Row(
                children: [
                  Text('Powered by: Rics Technologies'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
