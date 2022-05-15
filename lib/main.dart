import 'package:flutter/material.dart';
import 'package:gameappui/UIhelpers/rpsCustomPainter.dart';
import 'package:gameappui/UIhelpers/uiConfigs.dart';
import 'package:gameappui/expandable_bottom/widget.dart';
import 'package:gameappui/konstants.dart';
import 'package:gameappui/tabs/feedtab.dart';
import 'package:gameappui/tabs/livetab.dart';
import 'package:gameappui/tabs/matchtab.dart';
import 'package:gameappui/widgets/CustomDrawer.dart';
import 'dart:ui' as ui;

import 'package:gameappui/widgets/bottom_bar_stack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExpandableBottomBar(),
    );
  }
}

class HomeStack extends StatefulWidget {
  @override
  State<HomeStack> createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // Create a key
  var xOffset = 0.0;

  var yOffset = 0.0;
  var scaleFactor = 1.0;
  bool isDrawerOpened = false;
  late AnimationController _controller;
  late TabController _tabController;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    var WIDTH = MediaQuery.of(context).size.width;
    var HEIGHT = MediaQuery.of(context).size.height;
    bool _canBeDragged = false;
    return Scaffold(
      key: _scaffoldKey,
      body: GestureDetector(
        onHorizontalDragStart: (detals) {
          bool isDragOpenFromLeft =
              _controller.isDismissed && detals.globalPosition.dx < WIDTH / 2;
          bool isDragCloseFromRight =
              _controller.isCompleted && detals.globalPosition.dx > WIDTH / 2;
          _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
        },
        onHorizontalDragUpdate: (details) {
          if (_canBeDragged) {
            double delta = details.primaryDelta! / WIDTH;
            _controller.value += delta;
          }
        },
        onHorizontalDragEnd: (details) {
          if (_controller.isDismissed || _controller.isCompleted) {
            return;
          } else if (_controller.value > 0.5) {
            _controller.forward();
            isDrawerOpened = true;
          } else {
            _controller.reverse();
          }
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            double slide = 225 * _controller.value;
            double scale = 1 - (0.3 * _controller.value);
            return Stack(
              children: [
                Container(
                  width: WIDTH,
                  color: Colors.blue,
                  child: CustomDrawer(),
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(isDrawerOpened ? 30 : 0),
                        topRight: Radius.circular(isDrawerOpened ? 30 : 0),
                        bottomLeft: Radius.circular(isDrawerOpened ? 35 : 0),
                      ),
                    ),
                    height: HEIGHT,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
