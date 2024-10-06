import 'dart:convert';

import 'package:deneme/constants/app_color.dart';
import 'package:deneme/constants/strings.dart';
import 'package:deneme/ui/chat_veiw/view_chat.dart';
import 'package:deneme/ui/home_view/vm_home.dart';
import 'package:deneme/widgets/button_basic.dart';
import 'package:deneme/widgets/text_basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class ViewHome extends StatefulWidget {
  ViewHome({
    super.key,
  });

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  VmHome vmHome = Get.put(VmHome());
  late GoogleMapController mapController;
  final gemini = Gemini.instance;
//  String? advice;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   trainBot();
  // }

  // void trainBot() async {
  //   // JSON dosyasını okuma
  //   String jsonString =
  //       await rootBundle.loadString('assets/jsons/prompts.json');
  //   print("-------------------00");

  //   // JSON verisini çözümleme
  //   final jsonResponse = json.decode(jsonString);

  //   print(jsonResponse.toString());
  //   await gemini
  //       .text(String.fromEnvironment(
  //           jsonResponse["system_prompt"]["description"]))
  //       .then(
  //     (value) {
  //       print(jsonResponse["system_prompt"]["description"]);
  //       advice = value?.content?.parts?.last.text;
  //       setState(() {});
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _map(context, vmHome),
          _AiCard(context),
        ],
      ),
    );
  }

  Widget _AiCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Chat());
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * .15,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                color: AppColor().shadow,
                spreadRadius: .2,
                offset: const Offset(0, 4))
          ],
          borderRadius: BorderRadius.circular(16),
          color: AppColor().yellow,
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/images/robot.png",
              height: MediaQuery.sizeOf(context).height * .1,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: MediaQuery.sizeOf(context).height * .1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor().white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextBasic(
                    text: AppStrings().talkWithAI,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget _map(BuildContext context, VmHome vmHome) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * .65,
          height: MediaQuery.sizeOf(context).height * .45,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Obx(
                () => GoogleMap(
                  zoomControlsEnabled: false,
                  //mapType: MapType.satellite,
                  //  markers: vmHome.markers,
                  onMapCreated: (controller) {
                    setState(() {
                      mapController = controller;
                    });
                  },

                  // ignore: invalid_use_of_protected_member
                  polygons: vmHome.polygons.value,
                  initialCameraPosition: CameraPosition(
                    target: vmHome.center,
                    zoom: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            MiniButtonBasic(
              ontap: () {
                vmHome.selectedValue.value = AppStrings().temperature;
                vmHome.setPolygons();
              },
              title: AppStrings().temperature,
            ),
            MiniButtonBasic(
              ontap: () {
                vmHome.selectedValue.value = AppStrings().humidity;
                vmHome.setPolygons();
              },
              title: AppStrings().humidity,
            ),
            MiniButtonBasic(
              ontap: () {
                vmHome.selectedValue.value = AppStrings().ph;
                vmHome.setPolygons();
              },
              title: AppStrings().ph,
            ),
            MiniButtonBasic(
              ontap: () {
                vmHome.selectedValue.value = AppStrings().phosphorus;
                vmHome.setPolygons();
              },
              title: AppStrings().phosphorus,
            ),
            MiniButtonBasic(
              ontap: () {
                vmHome.selectedValue.value = AppStrings().calcium;
                vmHome.setPolygons();
              },
              title: AppStrings().calcium,
            ),
          ],
        ),
      ],
    );
  }
}
