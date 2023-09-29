import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants.dart';
import '../../screens/map/map_marker.dart';
import '../../screens/else/profile_details_screen.dart';

class MapItemDetails extends StatelessWidget {
  const MapItemDetails({Key? key, required this.mapMarker}) : super(key: key);

  final MapMarker mapMarker;

  @override
  Widget build(BuildContext context) {

    final _styleAddress = TextStyle(
      color: Colors.white,
      fontSize: 15,
    );

    final _styleTitle = TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.bold,
    );

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        margin: EdgeInsets.zero,
        color: Colors.grey[800],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        mapMarker.image,
                        fit: BoxFit.cover,

                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "المرشح: ${mapMarker.title}",
                          textDirection: TextDirection.rtl,
                          style: _styleTitle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "رقم الدائرة: ${mapMarker.circle}",
                          style: _styleAddress,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "القائمة: ${mapMarker.list}",
                          style: _styleAddress,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              onPressed: () {
                Get.offAll(() => ProfileDetailsScreen(mapMarker: mapMarker));
              },
              color: mainColor,
              child: Text(
                'التفاصيل والتصويت',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.zero,
              elevation: 6,
            ),
          ],
        ),
      ),
    );
  }
}
