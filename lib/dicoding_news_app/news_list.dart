import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental_dicoding/common/globals.dart';
import 'package:flutter_fundamental_dicoding/dicoding_news_app/article_list_page.dart';
import 'package:flutter_fundamental_dicoding/dicoding_news_app/article_list_page_offline.dart';
import 'package:flutter_fundamental_dicoding/dicoding_news_app/setting_page.dart';
import 'package:flutter_fundamental_dicoding/common/platform_widget.dart';
import 'package:flutter_fundamental_dicoding/common/styles.dart';

import 'article_detail_offline.dart';
import '../models/articleOffline.dart';

class NewsListPage extends StatefulWidget {
  static const routeName = '/dicoding_news_app/news_list';

  const NewsListPage({Key? key}) : super(key: key);

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondaryColor,
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          activeColor: secondaryColor, items: _bottomNavBarItems),
      tabBuilder: (context, index) {
        return _listWidget[index];
      },
    );
  }

  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(isIos ? CupertinoIcons.news : Icons.public),
      label: 'Headline',
    ),
    BottomNavigationBarItem(
      icon: Icon(isIos ? CupertinoIcons.settings : Icons.settings),
      label: 'Settings',
    ),
  ];

  final List<Widget> _listWidget = [
    ArticleListPage(),
    SettingsPage(),
  ];

  // final List<Widget> _listWidget = [
  //   ArticleListOfflinePage(),
  //   SettingsPage(),
  // ];
}
