import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class ExpandableBottomBar extends StatefulWidget {
  const ExpandableBottomBar({Key? key}) : super(key: key);

  @override
  State<ExpandableBottomBar> createState() => _ExpandableBottomBarState();
}

class _ExpandableBottomBarState extends State<ExpandableBottomBar>
    with TickerProviderStateMixin {
  double _maxHeight = 575;
  double _minHeight = 75;
  late double _currentHeight;
  late AnimationController _controller;
  bool _expanded = false;
  int _selectedIndex = 0;
  @override
  void initState() {
    _currentHeight = _maxHeight;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final _pagesList = List.generate(
      13,
      (index) => Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Center(
                child: Text(
              'Page ${index + 1} Content',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
          ));

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final menuWidth = size.width * 0.3;
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            if (_expanded) {
              _controller.reverse();
              setState(() {
                _expanded = false;
              });
            }
          },
          child: _pagesList[_selectedIndex]),
      extendBody: true,
      bottomNavigationBar: GestureDetector(
        onVerticalDragUpdate: _expanded
            ? (details) {
                setState(() {
                  final newHeght = _currentHeight - details.delta.dy;
                  _controller.value = _currentHeight / _maxHeight;
                  _currentHeight = newHeght.clamp(_minHeight, _maxHeight);
                });
                if (details.delta.dy > _maxHeight / 2) {
                  setState(() {
                    _expanded = false;
                  });
                }
              }
            : null,
        onVerticalDragEnd: _expanded
            ? (details) {
                if (_currentHeight < _maxHeight / 2) {
                  _controller.reverse();
                  _expanded = false;
                } else {
                  _expanded = true;
                  _controller.forward(from: _currentHeight / _maxHeight);
                  _currentHeight = _maxHeight;
                }
                setState(() {});
              }
            : null,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            final value = ElasticInCurve(.7).transform(_controller.value);
            return Stack(
              children: [
                Positioned(
                    height: lerpDouble(_minHeight, _maxHeight, value),
                    width: lerpDouble(menuWidth, size.width, value),
                    bottom: lerpDouble(40, 0, value),
                    left: lerpDouble(size.width / 2 - menuWidth / 2, 0, value),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color:
                              _expanded ? Colors.indigoAccent : Colors.indigo,
                          borderRadius: BorderRadius.vertical(
                              top:
                                  Radius.circular(lerpDouble(20, 20.0, value)!),
                              bottom:
                                  Radius.circular(lerpDouble(20, 0, value)!))),
                      child: _expanded
                          ? (_currentHeight > _maxHeight / 1.5
                              ? _buildExpandedWidget()
                              : null)
                          : _buildCollabsedWidget(),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildExpandedWidget() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.zero,
          width: double.infinity,
          height: _maxHeight,
          color: Colors.indigoAccent,
          child: Column(
            children: [
              Container(
                  width: double.infinity, child: const Icon(Icons.drag_handle)),
              Expanded(
                flex: 1,
                child: GridView.builder(
                    itemCount: _iconList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _controller.reverse();
                          _selectedIndex = index;
                          _expanded = false;
                          setState(() {});
                        },
                        child: Wrap(
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                _iconList[index],
                                color: Colors.white,
                                size: 55,
                              ),
                            ),
                            Text(
                              'Page ${index + 1}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //create list of 20 random icons
  final List _iconList = [
    Icons.newspaper,
    Icons.access_time,
    Icons.ac_unit,
    Icons.accessibility,
    Icons.accessible,
    Icons.accessible_forward,
    Icons.account_balance,
    Icons.account_balance_wallet,
    Icons.account_box,
    Icons.account_circle,
    Icons.adb,
    Icons.add,
    Icons.add_a_photo,
  ];

  Widget _buildCollabsedWidget() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = true;
          _currentHeight = _maxHeight;
          _controller.forward(from: 0.0);
        });
      },
      child: Container(
        color: Colors.indigo,
        width: double.infinity,
        height: _minHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(
              Icons.settings,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              size: 25,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
