import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/analytics_screen.dart';

import 'package:sentezel/books/books_screen.dart';
import 'package:sentezel/common/constants/route_constant.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/screens/control_center_screen.dart';

import 'package:sentezel/home/ui/home_screen.dart';
import 'package:sentezel/new_transaction/new_transaction_Center_screen.dart';
import 'package:sentezel/new_transaction/purchase/purchase_of_asset/purchase_of_asset_screen.dart';

import 'package:sentezel/setup/intialize_app.dart';

import 'package:sentezel/setup/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sentezel',
      theme: ThemeData(
        canvasColor: Palette.background,
        primarySwatch: Colors.grey,
      ),
      routes: {
        RouteConstant.home: (context) => const HomeScreen(),
        RouteConstant.analytics: (context) => const AnalyticsScreen(),
        RouteConstant.books: (context) => const BooksScreen(),
        RouteConstant.controlCenter: (context) => const ControlCenterScreen(),
        RouteConstant.newTransaction: (context) =>
            const NewTranscationCenterScreen(),
        RouteConstant.purchaseOfAsset: (context) =>
            const PurchaseOfAssetScreen(),
      },
      home: SplashScreen(),
    );
  }
}
