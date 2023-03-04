import 'dart:io';

import 'package:flutter/material.dart';

import 'package:myapp/new/screen/main_tab_bar/widgets/bottom_icon_widget.dart';

import '../../../constants/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../message_list/message_list.dart';
import '../notifcations/notifcations.dart';
import '../page/page.dart';

class MainTabBar extends StatefulWidget {
  const MainTabBar({Key? key}) : super(key: key);

  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  int pageIndex = 2;

  final pages = [
    SamplePage(
      title: 'Home Page',
    ),
    SamplePage(
      title: 'Friends Page',
    ),
    MessageListPage(),
    NotificationsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[pageIndex],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Theme.of(context).bottomAppBarColor,
        margin: const EdgeInsets.only(top: 2, right: 0, left: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomIconWidget(
              title: 'Home',
              iconName: Assets.icons.icHome.path,
              iconColor: pageIndex == 0
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              tap: () {
                setState(() {
                  pageIndex = 0;
                });
              },
            ),

            BottomIconWidget(
              title: 'Friends',
              iconName: Assets.icons.users.path,
              iconColor: pageIndex == 1
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              tap: () {
                setState(() {
                  pageIndex = 1;
                });
              },
            ),

            BottomIconWidget(
              title: 'Messages',
              iconName: Assets.icons.icChat.path,
              iconColor: pageIndex == 2
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              tap: () {
                setState(() {
                  pageIndex = 2;
                });
              },
            ),
            BottomIconWidget(
              title: 'Settings',
              iconName: Assets.icons.icSettings.path,
              iconColor: pageIndex == 3
                  ? Theme.of(context).primaryColor
                  : AppColors.gray,
              tap: () {
                setState(() {
                  pageIndex = 3;
                });
              },
            ),
            // const SizedBox(
            //   width: 20,
            // ),
            //
            // BottomIconWidget(
            //   title: 'Manage vehicle',
            //   iconName: pageIndex == 2
            //       ? Assets.icons.icSelectedTaskSquare
            //       : Assets.icons.icTaskSquare,
            //   iconColor: pageIndex == 2
            //       ? Theme.of(context).primaryColor
            //       : Theme.of(context).textTheme.titleMedium!.color,
            //   tap: () {
            //     setState(() {
            //       pageIndex = 2;
            //     });
            //   },
            // ),

            // BottomIconWidget(
            //   title: 'More',
            //   iconName: pageIndex == 3
            //       ? Assets.icons.icSelectedMore
            //       : Assets.icons.icMore,
            //   iconColor: pageIndex == 3
            //       ? Theme.of(context).primaryColor
            //       : Theme.of(context).textTheme.titleMedium!.color,
            //   tap: () {
            //     setState(() {
            //       pageIndex = 3;
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
