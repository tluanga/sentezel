// ignore_for_file: constant_identifier_names

import 'dart:math';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sentezel/common/ui/widget/settings_ellipse_widget.dart';
import 'package:sentezel/home/ui/control_card_widget.dart';
import 'package:sentezel/home/ui/header_card_widget.dart';
import 'package:sentezel/home/ui/latest_transaction_widget.dart';

// const mainColor = Colors.blue;
class AnimatedHome extends StatefulWidget {
  const AnimatedHome({Key? key}) : super(key: key);

  @override
  _AnimatedHomeState createState() => _AnimatedHomeState();
}

class _AnimatedHomeState extends State<AnimatedHome> {
  final scrollNotifier = ValueNotifier(0.0);
  final scrollController = ScrollController();
  void _onListen() {
    scrollNotifier.value = scrollController.offset;
  }

  @override
  void initState() {
    scrollController.addListener(_onListen);

    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double cardHeaderSize = MediaQuery.of(context).size.height * 0.3 + 250;
    return Scaffold(
      body: SafeArea(
          child: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            ValueListenableBuilder<double>(
                valueListenable: scrollNotifier,
                builder: (context, snapshot, _) {
                  double space = cardHeaderSize - kToolbarHeight;
                  final percent = lerpDouble(
                      0.0, -pi / 2, (snapshot / space).clamp(0.0, 1.0));
                  var opacity =
                      lerpDouble(1.0, 0.0, (snapshot / space).clamp(0.0, 1.0));
                  return SliverAppBar(
                    leadingWidth: 64,
                    centerTitle: false,
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    expandedHeight: cardHeaderSize,
                    leading: Container(
                        alignment: Alignment.topLeft,
                        child: const SettingsEllipseWidget()),
                    stretch: true,

                    //-------------------Business Card------------------
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.only(
                          top: 35,
                        ),
                        child: SizedBox(
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SlideInDown(
                                child: Opacity(
                                  opacity: opacity!.toDouble(),
                                  child: Transform(
                                    transform: Matrix4.identity()
                                      ..setEntry(3, 2, 0.001)
                                      ..rotateX(percent!),
                                    alignment: Alignment.center,
                                    child: const HomeHeaderCard(),
                                  ),
                                ),
                              ),
                              FadeInLeft(child: const HomeControlCard()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ];
        },
        body: const HomeLatestTransactionWidget(),
      )),
    );
  }
}
