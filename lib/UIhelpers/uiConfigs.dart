import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gameappui/tabs/feedtab.dart';
import 'package:gameappui/tabs/livetab.dart';
import 'package:gameappui/tabs/matchtab.dart';

const List<Map<String, dynamic>> myTabs = [
  {
    'title': 'Feed',
    'tab': Tab(
      icon: Icon(
        Icons.feed,
        size: 35,
      ),
    ),
    'icon': Icons.feed,
    'tabView': FeedTab(),
  },
  {
    'title': 'Match',
    'tab': Tab(
      icon: Icon(
        Icons.join_full,
        size: 35,
      ),
    ),
    'icon': Icons.join_full,
    'tabView': MatchTab(),
  },
  {
    'title': 'Live',
    'tab': Tab(
      icon: Icon(
        Icons.live_tv,
        size: 35,
      ),
    ),
    'icon': Icons.live_tv,
    'tabView': LiveTab(),
  },
];
