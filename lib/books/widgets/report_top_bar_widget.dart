import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/widget/settings_ellipse_widget.dart';

class ReportTopBarWidget extends StatelessWidget {
  final String title;
  final Function onGeneratePdf;
  final Function onGenerateExcel;
  final Function onClose;

  const ReportTopBarWidget({
    Key? key,
    required this.title,
    required this.onGenerateExcel,
    required this.onGeneratePdf,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SettingsEllipseWidget(),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  onGenerateExcel();
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Center(
                    child: Image.asset('assets/icons/excel.png'),
                  ),
                ),
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  onGeneratePdf();
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Center(
                    child: Image.asset('assets/icons/pdf.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            onClose();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              CupertinoIcons.xmark_circle,
              size: 45,
              color: Colors.red.shade400,
            ),
          ),
        ),
      ],
    );
  }
}
