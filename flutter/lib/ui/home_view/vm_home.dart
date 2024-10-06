import 'package:deneme/constants/strings.dart';
import 'package:deneme/widgets/polygon_basic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<String> mapKeys = ["area 0", "area 1", "area 2", "area 3"];
List<LatLng> mapHivePoints = [
  const LatLng(39.928340, 32.863447),
  const LatLng(39.927906, 32.867086),
  const LatLng(39.926244, 32.860613),
  const LatLng(39.924401, 32.862394)
];
List<Color> mapColors = const [
  Color.fromARGB(255, 3, 196, 70),
  Color.fromARGB(255, 247, 125, 45),
  Color.fromARGB(255, 28, 154, 177),
  Color.fromARGB(255, 238, 234, 3)
];
Map<String, List<LatLng>> areas = {
  mapKeys[0]: const [
    LatLng(39.928340, 32.863447),
    LatLng(39.928185, 32.865177),
    LatLng(39.926771, 32.863413),
    LatLng(39.927414, 32.862333),
    LatLng(39.927962, 32.863255),
  ],
  mapKeys[1]: const [
    LatLng(39.928185, 32.865177),
    LatLng(39.928087, 32.866561),
    LatLng(39.927906, 32.867086),
    LatLng(39.927649, 32.866936),
    LatLng(39.925996, 32.864737),
    LatLng(39.926771, 32.863413),
  ],
  mapKeys[2]: const [
    LatLng(39.927414, 32.862333),
    LatLng(39.926771, 32.863413),
    LatLng(39.925253, 32.861463),
    LatLng(39.926244, 32.860613),
  ],
  mapKeys[3]: const [
    LatLng(39.926771, 32.863413),
    LatLng(39.925996, 32.864737),
    LatLng(39.924275, 32.862435),
    LatLng(39.925253, 32.861463),
  ]
};

class VmHome extends GetxController {
  @override
  void onInit() {
    super.onInit();

    setPolygons();
    setMarker();
  }

  Map<String, List> polygonColor = {
    AppStrings().temperature: [
      mapColors[0],
      mapColors[1],
      mapColors[2],
      mapColors[3],
    ],
    AppStrings().humidity: [
      mapColors[0],
      mapColors[0],
      mapColors[0],
      mapColors[1],
    ],
    AppStrings().ph: [
      mapColors[3],
      mapColors[1],
      mapColors[2],
      mapColors[2],
    ],
    AppStrings().phosphorus: [
      mapColors[1],
      mapColors[1],
      mapColors[0],
      mapColors[0],
    ],
    AppStrings().calcium: [
      mapColors[2],
      mapColors[1],
      mapColors[2],
      mapColors[2],
    ],
  };
  RxString selectedValue = AppStrings().calcium.obs;
  final polygons = <Polygon>{}.obs;
  final LatLng center = const LatLng(39.926862, 32.863656);
  Set<Marker> markers = Set<Marker>();
  List<LatLng> points = [];
  void setPolygons() {
    // ignore: invalid_use_of_protected_member
    polygons.value = {};
    for (int i = 0; i < 4; i++) {
      // ignore: invalid_use_of_protected_member
      polygons.value.add(polygonBasic(
        title: mapKeys[i],
        points: areas[mapKeys[i]],
        color: polygonColor[selectedValue.value]![i],
        // ontap: () {
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         titlePadding: const EdgeInsets.all(8),
        //         contentPadding: const EdgeInsets.all(4),
        //         title: const Text("mapKeys[i],"),
        //         content: const Padding(
        //           padding: EdgeInsets.all(8.0),
        //           child: Column(
        //             mainAxisSize: MainAxisSize.min,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text("data"),
        //               Divider(),
        //               Text("data"),
        //               Divider(),
        //               Text("data"),
        //               Divider(),
        //               Text("data")
        //             ],
        //           ),
        //         ),
        //         actions: [
        //           TextButton(
        //             onPressed: () {
        //               Navigator.of(context).pop();
        //             },
        //             child: const Text('Close'),
        //           ),
        //         ],
        //       );
        //     },
        //   );
        // }
      ));
    }
    polygons.refresh();
  }

  void setMarker() async {
    await BitmapDescriptor.asset(
            height: 48,
            width: 32,
            ImageConfiguration(),
            "assets/images/bee-marker.png")
        .then(
      (value) {
        custommarker = value;
      },
    );
    for (int i = 0; i < 4; i++) {
      markers.add(
        Marker(
          markerId: MarkerId(mapKeys[i]),
          position: mapHivePoints[i],
          icon: custommarker!,
          // onTap: () {
          //   _showBottomSheet(context);
          // },
          // infoWindow: InfoWindow(
          //   onTap: () {},
          //   title: mapKeys[i],
          //   anchor: Offset.fromDirection(0.5),
          //   snippet: "details",
          // ),
        ),
      );
    }
  }
}

BitmapDescriptor? custommarker;
void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 200,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Seçenek 1'),
              onTap: () {
                print('Seçenek 1 tıklandı');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Seçenek 2'),
              onTap: () {
                print('Seçenek 2 tıklandı');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.directions),
              title: const Text('Seçenek 3'),
              onTap: () {
                print('Seçenek 3 tıklandı');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
