import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controller/search_controller.dart';
import '../../../utils/constants.dart';
import '../else/profile_details_screen.dart';
import '../map/map_marker.dart';
import 'package:latlong2/latlong.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required MapMarker mapMarker,}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();

}

class _SearchScreenState extends State<SearchScreen> {
  final controller = Get.put(MySearchController());
  List<MapMarker> persons = mapMarkers;

  final _styleTitle = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  final _styleAddress = TextStyle(
    color: Colors.white,
    fontSize: 11,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GetBuilder<MySearchController>(
                  builder: (_) => TextField(
                        autofocus: false,
                        controller: controller.searchBarController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        onChanged: searchBook,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          focusColor: Colors.red,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xff8D8D8D),
                          ),
                          suffixIcon:
                              controller.searchBarController.text.isNotEmpty
                                  ? IconButton(
                                      onPressed: () {
                                        controller.clearSearch();
                                        searchBook('');
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.black,
                                      ))
                                  : null,
                          hintText: '..ابحث عن المرشح المناسب',
                          hintStyle: TextStyle(
                            fontFamily: 'Circular',
                            color: Color(0xff676767),
                            fontSize: 14,
                          ),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )),
            ),
            Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final person = persons[index];
                    return GestureDetector(
                      onTap: (){
                        Get.offAll(() => ProfileDetailsScreen(mapMarker: person));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 5,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: darkGreyClr,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage('${person.image}'),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${person.title}",
                                    textDirection: TextDirection.rtl,
                                    style: _styleTitle,
                                  ),
                                  Text(
                                    "${person.circle}",
                                    style: _styleAddress,
                                  ),
                                  Text(
                                    "${person.list}",
                                    style: _styleAddress,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: persons.length,
                )),

          ],
        ),
      ),
    );
  }

  void searchBook(String searchContent) {
    final suggestions = mapMarkers.where((person) {
      final personName = person.title.toLowerCase();
      final input = searchContent.toLowerCase();

      return personName.contains(input);
    }).toList();

    setState(() {
      persons = suggestions;
    });
  }
}
