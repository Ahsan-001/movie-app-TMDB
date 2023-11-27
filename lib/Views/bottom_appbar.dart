import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_colors.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_textstyle.dart';
import 'package:movieapp/Views/dashboard/dashboard_view.dart';
import 'package:movieapp/Views/media/media_view.dart';
import 'package:movieapp/Views/more/more_view.dart';
import 'package:movieapp/Views/watch/main/watch_view.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final kTabPages = [
      const DashboardView(),
      WatchView(),
      const MediaView(),
      const MoreView(),
    ];
    final kBottmonNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(Icons.dashboard), label: "Dashboard"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.play_arrow), label: "Watch"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.browse_gallery), label: "Media Library"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.more_vert_sharp), label: "More"),
    ];
    assert(kTabPages.length == kBottmonNavBarItems.length);
    final bottomNavBar = Container(
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: kPrimaryColor,
        unselectedItemColor: greyColor,
        elevation: 0,
        iconSize: 20,
        selectedFontSize: 12,
        selectedItemColor: whiteColor,
        selectedLabelStyle: h12HeadingWhiteBold,
        unselectedFontSize: 12,
        items: kBottmonNavBarItems,
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(
            () {
              _currentTabIndex = index;
            },
          );
        },
      ),
    );
    return Scaffold(
      body: kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
