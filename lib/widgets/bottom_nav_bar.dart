import 'package:flutter/material.dart';
import 'package:flutter_news_app_ui/screens/article_screen.dart';
import 'package:flutter_news_app_ui/screens/discover_screen.dart';
import 'package:flutter_news_app_ui/screens/home_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key,

    required this.index,

  }) : super(key: key);

  final int index; // index of each icon clicked in the bottom navigation bar will be received here

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false, //hide the labels
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,

      //In Flutter, the Color class provides the ability to set an alpha channel value for a color using the withAlpha() method. The alpha channel determines the transparency of a color, with a value of 0 being completely transparent and a value of 255 being completely opaque.
      // The withAlpha() method takes an integer value as its argument, which represents the alpha value for the color. This value must be between 0 and 255, inclusive.
      // 'Colors.black.withAlpha(100)' sets the color to black with an alpha value of 100, which means the color is partially transparent. The resulting color will be a dark gray, as the transparency allows some of the background to show through.
      unselectedItemColor: Colors.black.withAlpha(100),

      items: [   // this is the list of items that we will have inside the "BottomNavigationBar"

        BottomNavigationBarItem(   // when user click on each icon he will be redirected to a different screen
            icon: Container(
              margin: const EdgeInsets.only(left: 30),  // bringing the first Icon closer to center Icon
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                icon: const Icon(Icons.home),
              ),
            ),
            label: 'Home'
        ),

        BottomNavigationBarItem(   // when user click on each icon he will be redirected to a different screen
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, DiscoverScreen.routeName);
              },
              icon: const Icon(Icons.search),
            ),
            label: 'Search'
        ),

        BottomNavigationBarItem(   // when user click on each icon he will be redirected to a different screen
            icon: Container(
              margin: const EdgeInsets.only(right: 30),  // bringing the last Icon closer to center Icon
              child: IconButton(
                onPressed: () {
                  print("No profile screen yet");
                },
                icon: const Icon(Icons.person),
              ),
            ),
            label: 'Profile'
        ),

      ],
    );
  }
}
