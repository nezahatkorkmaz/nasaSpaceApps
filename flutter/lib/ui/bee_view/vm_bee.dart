import 'package:deneme/ui/home_view/vm_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VmBee extends GetxController {
  RxInt selectedBee = 0.obs;
  RxMap<int, List> beeValue = {
    0: [100, 70, 25, 38],
    1: [85, 35, 48, 38],
    2: [26, 21, 95, 38],
    3: [65, 60, 70, 25],
  }.obs;
  final LatLng center = const LatLng(39.926862, 32.863656);
  var markers = <Marker>{}.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setMarker();
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
          onTap: () {
            selectedBee.value = i;
          },
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
