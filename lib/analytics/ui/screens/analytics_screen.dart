import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/controller/analytics_controller.dart';

class AnalyticsScreen extends HookConsumerWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(analyticsControllerProvider);

    return state.when(data: (data) {
      return Scaffold(
        appBar: AppBar(),
        body: Text(data.transactionList.length.toString()),
      );
      ;
    }, error: (error, stackTrace) {
      return Scaffold(
        appBar: AppBar(),
        body: Text('error'),
      );
      ;
    }, loading: () {
      return Text('loading');
    });
  }
}
