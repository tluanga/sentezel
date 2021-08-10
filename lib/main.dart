import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/analytics_screen.dart';

import 'package:sentezel/books/books_screen.dart';
import 'package:sentezel/common/constants/route_constant.dart';
import 'package:sentezel/common/constants/ui_constant.dart';
import 'package:sentezel/common/ui/screens/controlCenter_screen.dart';
import 'package:sentezel/home/ui/home_screen.dart';
import 'package:sentezel/intializeApp.dart';
import 'package:sentezel/newTransaction/newTransaction_screen.dart';

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
        canvasColor: UiConstant.background,
        primarySwatch: Colors.grey,
      ),
      routes: {
        RouteConstant.home: (context) => HomeScreen(),
        RouteConstant.analytics: (context) => AnalyticsScreen(),
        RouteConstant.books: (context) => BooksScreen(),
        RouteConstant.controlCenter: (context) => ControlCenterScreen(),
        RouteConstant.newTransaction: (context) => NewTransactionScreen(),
      },
    );
  }
}
