import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 14, right: 8),
                color: const Color.fromRGBO(244, 239, 241, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "About Us",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 23, color: Colors.grey[800]),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        CupertinoIcons.xmark_circle,
                        color: Colors.orange,
                        size: 40,
                      ),
                    )
                  ],
                ),
              ),
              // Spacer(),
              title(),

              const Spacer(
                flex: 1,
              ),
              developBy(),
              const Spacer(
                flex: 2,
              ),
              publishby(),
              const Spacer(
                flex: 2,
              ),
              description(),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      color: const Color.fromRGBO(244, 239, 241, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              "Sentezel",
              style: GoogleFonts.aBeeZee(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Icon(Icons.calculate_outlined,
                    size: 20, color: Colors.grey[600]),
                Text(
                  "Accounting Software",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 13, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          version(),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget version() => Container(
        //  height: 50,
        // width: 250,
        padding: const EdgeInsets.only(left: 8),
        // decoration: BoxDecoration(
        //     // color: Color.fromRGBO(244, 239, 241, 1),
        //     borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 2,
              ),
              child: Row(
                children: [
                  Icon(CupertinoIcons.device_phone_portrait,
                      size: 20, color: Colors.grey[600]),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Version : 0.0.0",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 14,
                        //fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30.0),
            //   child: Text(
            //     "0.0.0",
            //     style:
            //         GoogleFonts.aBeeZee(fontSize: 14, color: Colors.grey[700]),
            //   ),
            // ),
          ],
        ),
      );

  Widget developBy() => Container(
        //   height: 120,
        // width: 250,
        padding: const EdgeInsets.only(left: 12),
        // decoration: BoxDecoration(
        //     // color: Color.fromRGBO(244, 239, 241, 1),
        //     borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.developer_board,
                  size: 20,
                  color: Colors.grey[600],
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Developed by :",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sentezel_Sente",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Sentezel_Sente",
                    style: GoogleFonts.aBeeZee(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 18,
                      ),
                      Text(
                        "9876543210",
                        style: GoogleFonts.aBeeZee(fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );

  Widget publishby() {
    return Container(
      //  height: 120,
      // width: 250,
      padding: const EdgeInsets.only(left: 12),
      // decoration: BoxDecoration(
      //     // color: Color.fromRGBO(244, 239, 241, 1),
      //     borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.publish_outlined,
                size: 20,
                color: Colors.grey[600],
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Published by :",
                style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sentezel_Sente",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 14, color: Colors.grey[700]),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Sentezel_Sente",
                  style: GoogleFonts.aBeeZee(fontSize: 14),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.phone,
                      size: 18,
                    ),
                    Text(
                      "9876543210",
                      style: GoogleFonts.aBeeZee(fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget description() => Container(
        //height: 120,
        // width: 250,
        padding: const EdgeInsets.only(left: 12),
        // decoration: BoxDecoration(
        //     // color: Color.fromRGBO(244, 239, 241, 1),
        //     borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.description_outlined,
                  size: 20,
                  color: Colors.grey[600],
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Description :",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sentezel_Sente",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Sentezel Sente app",
                    style: GoogleFonts.aBeeZee(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "sentezel app sentezel app",
                    style: GoogleFonts.aBeeZee(fontSize: 15),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
