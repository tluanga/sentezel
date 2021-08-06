import 'package:flutter/material.dart';

class HomeLatestTransactionWidget extends StatelessWidget {
  const HomeLatestTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          Text(
            'Latest Transaction',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, idex) {
                return _transaction();
              },
            ),
          )
        ],
      ),
    );
  }

  _transaction() {
    return Container(
      child: Row(
        children: [
          Text('Purchase of Raw Material'),
          Text('Rs. 10001001'),
        ],
      ),
    );
  }
}
