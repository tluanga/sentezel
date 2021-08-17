import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/activeInActive_enum.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/widget/topBarWithNewForBottomSheet_widget.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMasterList_controller.dart';
import 'package:sentezel/settings/party/newParty_modal.dart';

class PartySelectModal extends HookConsumerWidget {
  final Function(LedgerMaster) onSelectParty;
  final bool partial;
  const PartySelectModal({
    Key? key,
    required this.onSelectParty,
    required this.partial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(ledgerMasterListControllerProvider);
    final isLoading =
        ref.watch(ledgerMasterListControllerProvider.notifier).getIsLoading();
    final _searchTextEditingController = useTextEditingController();
    _onSearch() async {
      ref.read(ledgerMasterListControllerProvider.notifier).loadData(
            searchString: _searchTextEditingController.text,
          );
    }

    useEffect(() {
      _searchTextEditingController.addListener(_onSearch);
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              TopBarWithNewForBottomSheetWidget(
                label: 'Party Select',
                onNew: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => NewPartyModal(),
                  );
                },
              ),

              //------Searching Ledger Master and filtration will be done
              // based in input
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Search'),
                  controller: _searchTextEditingController,
                ),
              ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : _list(context, list),
            ],
          ),
        ),
      ),
    );
  }

  _list(BuildContext context, List<LedgerMaster> list) {
    print(list);
    list.sort((a, b) => a.name.compareTo(b.name));

    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _listItem(
              context: context, item: list[index], onSelect: onSelectParty);
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
        margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  item.getInitialLetter(),
                  style: TextStyle(
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.74,
                  child: Center(
                    child: Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.74,
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: Center(
                    child: Text(
                      item.description != item.name ? item.description : '',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.74,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: item.status == ActiveInActive.active
                            ? Text(
                                'Active',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              )
                            : Text(
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
