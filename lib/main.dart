import 'package:flutter/material.dart';

import 'screens/screens_routes.dart';    // in this file I have exported all the different screens so that so that it is easier to import them somewhere else

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News App UI',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),

      //Each route is defined as a Map with a key-value pair where the key is the name of the route and the value is a callback function that returns the Widget that will be displayed when the route is accessed.
      initialRoute: '/',
      routes: {
        // defining "NamedRoutes"
        HomeScreen.routeName: (context) => const HomeScreen(),  // Defining HomeScreen 'routeName' which will be written in the HomeScreen and upon calling that name we can navigate to HomeScreen
        DiscoverScreen.routeName: (context) => const DiscoverScreen(),
        ArticleScreen.routeName: (context) => const ArticleScreen(),
      },
    );
  }
}
