import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mnbr/utils/constants.dart';

import 'animated_markers_map.dart';

class MapAnimatedMarkerMap extends StatefulWidget {
  const MapAnimatedMarkerMap({Key? key}) : super(key: key);

  @override
  State<MapAnimatedMarkerMap> createState() => _MapAnimatedMarkerMapState();
}

class _MapAnimatedMarkerMapState extends State<MapAnimatedMarkerMap> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: AnimatedMarkersMap(),
    );
  }
}
