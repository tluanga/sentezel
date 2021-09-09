import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/pallete.dart';

class RpChartIndexControl extends StatefulWidget {
  final Function(int) onIncrease;
  final Function(int) onDecrease;
  final int noOfPages;
  RpChartIndexControl({
    Key? key,
    required this.onIncrease,
    required this.onDecrease,
    required this.noOfPages,
  }) : super(key: key);

  @override
  _RpChartIndexControlState createState() => _RpChartIndexControlState();
}

class _RpChartIndexControlState extends State<RpChartIndexControl> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    print('No of pages ${widget.noOfPages}');
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  if (index > 1) {
                    print('decrement');
                    widget.onDecrease(index--);
                  }
                },
              );
            },
            child: Container(
              child: Icon(
                CupertinoIcons.chevron_left,
                size: 30,
                color: index >= 2 && index <= widget.noOfPages
                    ? Palette.color1
                    : Colors.grey.shade600,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                widget.noOfPages < 1 ? '' : index.toString(),
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                widget.noOfPages < 1 ? '' : 'of',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                widget.noOfPages < 1 ? '' : widget.noOfPages.toString(),
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              if (index < widget.noOfPages) {
                print('increment');
                print(index);
                setState(() {
                  index++;
                });
                widget.onIncrease(index);
              }
            },
            child: Container(
              child: Icon(
                CupertinoIcons.chevron_right,
                size: 30,
                color: index >= 1 && index < widget.noOfPages
                    ? Palette.color1
                    : Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
