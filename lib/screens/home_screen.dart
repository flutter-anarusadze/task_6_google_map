import 'package:flutter/material.dart';
import 'package:task_6_google_map/data/world_wonders.dart';

import 'map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('World Wonders'),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                onTap: () => Navigator.of(context).pushNamed(
                  MapScreen.routeName,
                  arguments: worldWondersList[index],
                ),
                contentPadding: const EdgeInsets.all(8),
                title: Text(worldWondersList[index].name),
                subtitle: Text(worldWondersList[index].description),
              ),
            );
          },
          itemCount: worldWondersList.length,
        ));
  }
}
