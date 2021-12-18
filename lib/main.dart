import 'package:flutter/material.dart';
import 'package:task_6_google_map/screens/map_screen.dart';

import 'screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Wonders',
      home: const HomeScreen(),
      routes: {MapScreen.routeName: (ctx) => const MapScreen()},
    );
  }
}
