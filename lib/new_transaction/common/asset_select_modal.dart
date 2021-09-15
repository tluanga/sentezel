import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/status_enum.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/widget/top_bar_with_new_for_bottom_sheet_widget.dart';
import 'package:sentezel/settings/asset/asset_list_controller.dart';
import 'package:sentezel/settings/asset/new_asset_modal.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';

class AssetSelectModal extends HookConsumerWidget {
  final Function(LedgerMaster) onSelect;

  const AssetSelectModal({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(assetListControllerProvider);

    final _searchTextEditingController = useTextEditingController();
    _onSearch() async {
      ref.read(assetListControllerProvider.notifier).loadData(
            searchString: _searchTextEditingController.text,
          );
    }

    useEffect(() {
      _searchTextEditingController.addListener(_onSearch);
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBarWithNewForBottomSheetWidget(
              label: 'Asset Select',
              onNew: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const NewAssetModal(),
                );
              },
            ),

            //------Searching Ledger Master and filtration will be done
            // based in input
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Search'),
                controller: _searchTextEditingController,
              ),
            ),
            list.when(
                data: (data) => _list(context, data),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                error: (error, statck) {
                  return Text(error.toString());
                })
          ],
        ),
      ),
    );
  }

  _list(BuildContext context, List<LedgerMaster> list) {
    list.sort((a, b) => a.name.compareTo(b.name));
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _listItem(
              context: context, item: list[index], onSelect: onSelect);
        },
      ),
    );
  }

  _listItem(
      {required BuildContext context,
      required LedgerMaster item,
      required Function(LedgerMaster) onSelect}) {
    Color _color = Palette.color3;

    if (item.id / 2 == 0) _color = Palette.color1;

    return GestureDetector(
      onTap: () {
        onSelect(item);
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  item.getInitialLetter(),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.74,
                  child: Center(
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.74,
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: Center(
                    child: Text(
                      item.description != item.name ? item.description : '',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.74,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: item.status == Status.active
                            ? const Text(
                                'Active',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              )
                            : const Text(
                                'In-Active',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
