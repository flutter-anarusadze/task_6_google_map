import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task_6_google_map/data/world_wonders.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  static const routeName = '/map-screen';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final Set<Marker> _markes = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addMarker(WorldWonder wonderItem) {
    setState(() {
      _markes.add(
        Marker(
          markerId: MarkerId(
            wonderItem.name,
          ),
          position: wonderItem.latLong,
          infoWindow: InfoWindow(
              title: wonderItem.name, snippet: wonderItem.description,),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final wonderItem =
        ModalRoute.of(context)!.settings.arguments as WorldWonder;
    _addMarker(wonderItem);
    return Scaffold(
      appBar: AppBar(
        title: Text(wonderItem.name),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _markes,
            initialCameraPosition:
                CameraPosition(target: wonderItem.latLong, zoom: 10.0),
          )
        ],
      ),
    );
  }
}
