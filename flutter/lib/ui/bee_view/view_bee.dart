import 'package:deneme/constants/app_color.dart';
import 'package:deneme/constants/strings.dart';
import 'package:deneme/ui/bee_view/vm_bee.dart';
import 'package:deneme/widgets/chart.dart';
import 'package:deneme/widgets/text_basic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewBee extends StatefulWidget {
  const ViewBee({super.key});

  @override
  State<ViewBee> createState() => _ViewBeeState();
}

class _ViewBeeState extends State<ViewBee> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    VmBee vmBee = Get.put(VmBee());

    return SingleChildScrollView(
        child: Column(
      children: [
        _map(context, vmBee),
        Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextBasic(
                        text: "HIVE 1",
                        color: AppColor().white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * .45,
                      height: MediaQuery.sizeOf(context).height * .3,
                      child:
                          MyBarChart(vmBee.beeValue[vmBee.selectedBee.value]!),
                    ),
                  ],
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextBasic(
                        text: "HIVE 2",
                        color: AppColor().white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * .40,
                      height: MediaQuery.sizeOf(context).height * .3,
                      child:
                          MyBarChart(vmBee.beeValue[vmBee.selectedBee.value]!),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextBasic(
                        text: "HIVE 3",
                        color: AppColor().white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * .45,
                      height: MediaQuery.sizeOf(context).height * .3,
                      child:
                          MyBarChart(vmBee.beeValue[vmBee.selectedBee.value]!),
                    ),
                  ],
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextBasic(
                        text: "HIVE 4",
                        color: AppColor().white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * .40,
                      height: MediaQuery.sizeOf(context).height * .3,
                      child:
                          MyBarChart(vmBee.beeValue[vmBee.selectedBee.value]!),
                    ),
                  ],
                )
              ],
            )
          ],
        )
      ],
    ));
  }

  Widget _map(BuildContext context, VmBee vmBee) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .45,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Obx(
            () => GoogleMap(
              zoomControlsEnabled: false,
              //mapType: MapType.satellite,
              markers: vmBee.markers.value,
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                });
              },

              // ignore: invalid_use_of_protected_member
              //polygons: vmHome.polygons.value,
              initialCameraPosition: CameraPosition(
                target: vmBee.center,
                zoom: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
