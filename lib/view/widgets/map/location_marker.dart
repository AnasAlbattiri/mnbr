import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../screens/map/animated_markers_map.dart';

class LocationMarker extends StatelessWidget {
  LocationMarker({Key? key, this.selected = false}) : super(key: key);

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final size = selected ? MARKER_SIZE_EXPANDED : MARKER_SIZE_SHRINKED;
    return Center(
      child: AnimatedContainer(
        height: size,
        width: size,
        duration: const Duration(milliseconds: 400),
        child: Image.asset(
          'assets/images/marker.png',
          color: mainColor,
        ),
      ),
    );
  }
}