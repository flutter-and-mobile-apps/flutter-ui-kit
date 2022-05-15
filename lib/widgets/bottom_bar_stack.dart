import 'package:flutter/material.dart';
import 'package:gameappui/UIhelpers/rpsCustomPainter.dart';
import 'package:gameappui/konstants.dart';

class BottomBarStack extends StatelessWidget {
  final double WIDTH;
  final Map<String, Function> onClicks;
  final bool isDrawerOpened;
  final TabController tabController;
  final List<dynamic> tabs;
  BottomBarStack({
    required this.WIDTH,
    required this.onClicks,
    required this.isDrawerOpened,
    required this.tabController,
    required this.tabs,
  });

  void executeFunction({Function? function}) {
    function!();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: WIDTH,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(
                WIDTH,
                (WIDTH * 0.5555555555555556)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(isDrawerOpened),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: kNavColor,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ),
          Positioned(
            bottom: 25,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                spaceBetweenItems(WIDTH, 0.05),
                IconButton(
                  onPressed: () {
                    executeFunction(function: onClicks['menuButton']);
                  },
                  icon: Icon(
                    isDrawerOpened ? Icons.arrow_back_ios : Icons.menu,
                    size: isDrawerOpened ? 50 : 35,
                    color: Colors.white,
                  ),
                ),
                spaceBetweenItems(WIDTH, 0.03),
                Container(
                  width: WIDTH * .6,
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: tabs.map<Widget>((e) => e['tab']).toList(),
                      controller: tabController),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget spaceBetweenItems(double WIDTH, double percentage) => SizedBox(
      width: WIDTH * percentage,
    );
