import 'package:flutter/material.dart';

class ElevatedContainer extends StatelessWidget {
  final double outerBottomPadding;
  final double innerHorzPadding;
  final Widget child;
  const ElevatedContainer({
    Key? key,
    required this.child,
    required this.outerBottomPadding,
    required this.innerHorzPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: outerBottomPadding),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: innerHorzPadding),
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
        child: child,
      ),
    );
  }
}
