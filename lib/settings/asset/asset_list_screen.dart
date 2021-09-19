import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sentezel/settings/asset/asset_list_controller.dart';

class AssetListScreen extends HookConsumerWidget {
  const AssetListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(assetListControllerProvider.notifier).loadData();
    }, []);
    return Scaffold(
      body: ref.watch(assetListControllerProvider).when(data: (data) {
        return Text('data');
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }, error: (error, stack) {
        return Container(child: Text(error.toString()));
      }),
    );
  }
}
