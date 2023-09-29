import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:mnbr/view/screens/else/home_screen.dart';
import 'package:mnbr/view/screens/map/map_marker.dart';
import '../../../utils/constants.dart';
import '../../widgets/map/center_location_marker.dart';
import '../../widgets/map/location_marker.dart';
import '../../widgets/map/map_item_details.dart';
import '../auth/search_screen.dart';

const MAPBOX_ACCESS_TOKEN =
    'sk.eyJ1IjoiYW5hc2JhdHRpcjU1IiwiYSI6ImNsbHc3amJmZzA0MXYzZHN5ZDRtOWV6cTcifQ.XCkLN0RZx1d_N338iGha1A';
const MAPBOX_STYLE = 'mapbox/dark-v10';
const MARKER_SIZE_EXPANDED = 50.0;
const MARKER_SIZE_SHRINKED = 33.0;
final _myLocation = LatLng(31.9539, 35.9106);

class AnimatedMarkersMap extends StatefulWidget {
  AnimatedMarkersMap({Key? key}) : super(key: key);

  @override
  State<AnimatedMarkersMap> createState() => _AnimatedMarkersMapState();
}

class _AnimatedMarkersMapState extends State<AnimatedMarkersMap>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController();
  late final AnimationController _animationController;
  int _selectedIndex = 0;
  late MapMarker mapMarker;

  List<Marker> _buildMarkers() {
    final _markerList = <Marker>[];
    for (int i = 0; i < mapMarkers.length; i++) {
      final mapItem = mapMarkers[i];
      _markerList.add(Marker(
        height: MARKER_SIZE_EXPANDED,
        width: MARKER_SIZE_EXPANDED,
        point: mapItem.location,
        builder: (_) {
          return GestureDetector(
            onTap: () {
              _selectedIndex = i;
              setState(() {
                _pageController.animateToPage(i,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.elasticOut);
                print('Selected: ${mapItem.title}');
              });
            },
            child: LocationMarker(
              selected: _selectedIndex == i,
            ),
          );
        },
      ));
    }
    return _markerList;
  }

  @override
  void initState() {
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
      location: LatLng(35.0003, 31.000),
    );
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 600,
      ),
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _markers = _buildMarkers();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,

          leading: IconButton(
            onPressed: () {
              Get.offAll(()=> HomeScreen());
            },
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 22,
            ),
          ),
          centerTitle: true,
          title: Text(
            'ابحث عن المرشح المناسب',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        endDrawer: SafeArea(
          child: Drawer(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: mapMarkers.length,
              itemBuilder: (context, index) {
                final item = mapMarkers[index];
                return SearchScreen(
                  mapMarker: item,
                );
              },
            ),
          ),
        ),
        body: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                minZoom: 5,
                maxZoom: 18,
                zoom: 10,
                center: _myLocation,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', // Access Token
                  additionalOptions: {
                    'accessToken': MAPBOX_ACCESS_TOKEN,
                    'id': MAPBOX_STYLE,
                  },
                ),
                MarkerLayer(
                  markers: _markers,
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                        height: 60,
                        width: 60,
                        point: _myLocation,
                        builder: (_) {
                          return CenterLocationMarker(_animationController);
                        })
                  ],
                ),
              ],
            ),
            // Add a pageview
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              height: MediaQuery.of(context).size.height * 0.3,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemCount: mapMarkers.length,
                itemBuilder: (context, index) {
                  final item = mapMarkers[index];
                  return MapItemDetails(
                    mapMarker: item,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
