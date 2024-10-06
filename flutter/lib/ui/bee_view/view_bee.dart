import 'package:deneme/constants/app_color.dart';
import 'package:deneme/constants/strings.dart';
import 'package:deneme/ui/bee_view/vm_bee.dart';
import 'package:deneme/widgets/text_basic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewBee extends StatelessWidget {
  const ViewBee({super.key});

  @override
  Widget build(BuildContext context) {
    VmBee vmBee = VmBee();
    return SingleChildScrollView(
        child: Column(
      children: [
        Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * .5,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ExpansionTile(
                      backgroundColor: AppColor().lightYellow,
                      collapsedBackgroundColor: AppColor().darkYellow,
                      title: TextBasic(text: "HIVE 1"),
                      children: [
                        _beeCard(vmBee, 0),
                        _beeCard(vmBee, 1),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ExpansionTile(
                      backgroundColor: AppColor().lightYellow,
                      collapsedBackgroundColor: AppColor().darkYellow,
                      title: TextBasic(text: "HIVE 2"),
                      children: [
                        _beeCard(vmBee, 2),
                        _beeCard(vmBee, 3),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ExpansionTile(
                      backgroundColor: AppColor().lightYellow,
                      collapsedBackgroundColor: AppColor().darkYellow,
                      title: TextBasic(text: "HIVE 3"),
                      children: [
                        _beeCard(vmBee, 0),
                        _beeCard(vmBee, 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Row(
            //   children: [
            //     _beeCard(vmBee, 0),
            //     _beeCard(vmBee, 1),
            //   ],
            // ),
            // Row(
            //   children: [
            //     _beeCard(vmBee, 2),
            //     _beeCard(vmBee, 3),
            //   ],
            // )
          ],
        ),
        _beesDetail(vmBee),
      ],
    ));
  }

  Widget _beeCard(VmBee vmBee, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          vmBee.selectedBee.value = index;
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColor().lightYellow,
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/bee-marker.png",
              height: 32,
            ),
          ),
        ),
      ),
    );
  }

  Widget _beesDetail(VmBee vmBee) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            color: AppColor().lightYellow,
            borderRadius: BorderRadius.circular(16)),
        width: double.infinity,
        child: Column(
          children: [
            _coloredBar(
              title: "Battery",
              value: vmBee.beeValue[vmBee.selectedBee.value]![0] * 1.0,
            ),
            _coloredBar(
                title: AppStrings().ph,
                value: vmBee.beeValue[vmBee.selectedBee.value]![1] * 1.0),
            _coloredBar(
                title: AppStrings().calcium,
                value: vmBee.beeValue[vmBee.selectedBee.value]![2] * 1.0),
            _coloredBar(
                title: AppStrings().humidity,
                value: vmBee.beeValue[vmBee.selectedBee.value]![3] * 1.0),
          ],
        ),
      ),
    );
  }

  Widget _coloredBar({required title, required double value}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
              width: 72,
              child: TextBasic(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              width: 200, // Barın genişliği
              height: 20, // Barın yüksekliği
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Barın arka plan rengi
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: value * 3, // Barın genişliği
                height: 20, // Barın yüksekliği
                child: Container(
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Colors.red, Colors.green],
                    stops: [0.0, 1.0],
                  ),
                )),
              ),

              //  Stack(
              //   children: [
              //     Container(
              //       width: 300, // Barın genişliği
              //       height: 30, // Barın yüksekliği
              //       child: Container(
              //           decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         gradient: const LinearGradient(
              //           colors: [Colors.red, Colors.green],
              //           stops: [0.0, 1.0],
              //         ),
              //       )),
              //     ),
              //     Align(
              //       alignment: Alignment.centerRight,
              //       child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: AppColor().white,
              //         ),

              //         width: vmBee.value.value * 1, // Barın genişliği
              //         height: 30, // Barın yüksekliği),)],
              //       ),
              //     ),
              //   ],
              // ),
            ),
          )
        ],
      ),
    );
  }
}
