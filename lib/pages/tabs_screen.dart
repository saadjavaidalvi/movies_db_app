import 'package:flutter/material.dart';
import 'package:movies_db_app/pages/dashboard_screen.dart';
import 'package:movies_db_app/pages/movies_search_screen.dart';
import 'package:movies_db_app/pages/under_development_screen.dart';
import 'package:movies_db_app/utils/custom_strings.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6FA),
      bottomNavigationBar: customBottomNavigationBar(),
      body: currentIndex == 0
          ? DashboardScreen(
              navigateTo: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )
          : currentIndex == 1
              ? const MoviesSearchScreen()
              : const UnderDevelopmentScreen(),
    );
  }

  Widget customBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff2E2739),
        borderRadius: BorderRadius.circular(27),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 17,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            itemWidget(
              CustomStrigns().homeText,
              Icons.home,
              0,
              () {
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            itemWidget(
              CustomStrigns().watchText,
              Icons.watch_later_rounded,
              1,
              () {
                setState(() {
                  currentIndex = 1;
                });
              },
            ),
            itemWidget(
              CustomStrigns().mediaLibraryText,
              Icons.perm_media,
              2,
              () {
                setState(() {
                  currentIndex = 2;
                });
              },
            ),
            itemWidget(
              CustomStrigns().moreText,
              Icons.menu,
              3,
              () {
                setState(() {
                  currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget itemWidget(
    String text,
    IconData iconData,
    int index,
    Function()? onTap,
  ) {
    return Expanded(
      child: Opacity(
        opacity: index == currentIndex ? 1 : .5,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                color: Colors.white,
                size: 22,
              ),
              Container(
                height: 5,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
