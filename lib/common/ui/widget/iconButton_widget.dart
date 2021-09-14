import 'package:flutter/material.dart';

class STLIconButton extends StatelessWidget {
  const STLIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.41,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade500,
          ),
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.07,
              child: Icon(Icons.restore),
              // child: Image.asset('assets/icons/pdf.png'),
            ),
            SizedBox(
              width: 5,
            ),
            Text('Backup Data')
          ],
        ),
      ),
    );
  }
}
