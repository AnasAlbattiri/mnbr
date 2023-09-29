import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:mnbr/utils/constants.dart';
import 'package:mnbr/view/screens/else/profile_details_screen.dart';
import 'package:mnbr/view/screens/map/map_marker.dart';
import 'package:latlong2/latlong.dart';
import '../../screens/map/map_animated_marker_map.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  late MapMarker mapMarker;

  @override
  void initState() {
    super.initState();
    mapMarker = MapMarker(
      about: '',
      email: '',
      education: '',
      birthDate: '',
      list: '',
      title: '',
      address: '',
      image: '',
      circle: '',
      location: LatLng(
        35.0003, 31.000
      ),
    );
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'ابحث عن مرشحك المناسب',
            baseStyle: TextStyle(
              fontFamily: 'Circular',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            selectedStyle: TextStyle(
              fontFamily: 'Circular',
              color: mainColor,

            )),
        MapAnimatedMarkerMap(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'Profile Details',
            baseStyle: TextStyle(
              fontFamily: 'Circular',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            selectedStyle: TextStyle(
              fontFamily: 'Circular',
              color: mainColor,
            )),
        ProfileDetailsScreen(mapMarker: mapMarker),
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.black87,
      backgroundColorAppBar: darkGreyClr,
      elevationAppBar: 0.0,
      isTitleCentered: true,
      screens: _pages,
      initPositionSelected: 0,
    );
  }
}
