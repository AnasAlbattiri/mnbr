import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screens/map/map_marker.dart';

class MySearchController extends GetxController {

  TextEditingController searchBarController = TextEditingController();


  // Function to clear the search content
  void clearSearch() {
    searchBarController.clear();

  }


}