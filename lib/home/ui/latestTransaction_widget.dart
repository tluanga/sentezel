import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/journal/journal_controller.dart';
import 'package:sentezel/books/journal/journal_model.dart';
import 'package:sentezel/common/ui/pallete.dart';

class HomeLatestTransactionWidget extends HookConsumerWidget {
  const HomeLatestTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Journal>> state = ref.watch(journalControllerProvider);
    return state.when(
        data: (data) {
          print(data);
          return _list(context, data);
        },
        loading: () => Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, stack) => Container(
              child: Text(error.toString()),
            ));
  }

  _list(BuildContext context, List<Journal> list) {
    list.sort((a, b) => a.date.compareTo(b.date));

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          print('index');

          return _listItem(
              context: context, item: list[index], onSelect: (item) {});
        },
      ),
    );
  }

  _listItem(
      {required BuildContext context,
      required Journal item,
      required Function(Journal) onSelect}) {
    Color _color = Palette.color3;

    _color = Palette.color1;

    return Container(
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
                    item.particular,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
