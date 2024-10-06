import 'package:deneme/constants/app_color.dart';
import 'package:deneme/constants/strings.dart';
import 'package:deneme/ui/person_view/vm_person.dart';
import 'package:deneme/widgets/text_basic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ViewPerson extends StatelessWidget {
  const ViewPerson({super.key});

  @override
  Widget build(BuildContext context) {
    VmPerson vmPerson = Get.put(VmPerson());
    return SingleChildScrollView(
      child: Column(
        children: [
          _personCard(context),
          _beeCardTile(vmPerson, 1),
          _beeCardTile(vmPerson, 2),
          _beeCardTile(vmPerson, 3),
          _beeCardTile(vmPerson, 4),
        ],
      ),
    );
  }

  Padding _beeCardTile(VmPerson vmPerson, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ExpansionTile(
          collapsedTextColor: AppColor().darkYellow,
          collapsedBackgroundColor: AppColor().darkYellow,
          backgroundColor: AppColor().darkYellow,
          title: Row(
            children: [
              _beeCard(vmPerson, 0),
              TextBasic(
                text: "Bee $index",
                color: AppColor().black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              )
            ],
          ),
          children: [_beesDetail(vmPerson, (index - 1))],
        ),
      ),
    );
  }

  Widget _beesDetail(VmPerson vmBee, int index) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            color: AppColor().darkYellow,
            borderRadius: BorderRadius.circular(16)),
        width: double.infinity,
        child: Column(
          children: [
            _coloredBar(
              title: AppStrings().battary,
              value: vmBee.beeValue[index]![0] * 1.0,
            ),
            _coloredBar(
                title: AppStrings().ph, value: vmBee.beeValue[index]![1] * 1.0),
            _coloredBar(
                title: AppStrings().calcium,
                value: vmBee.beeValue[index]![2] * 1.0),
            _coloredBar(
                title: AppStrings().humidity,
                value: vmBee.beeValue[index]![3] * 1.0),
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

  Widget _beeCard(VmPerson vmBee, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          vmBee.selectedBee.value = index;
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColor().darkYellow,
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

  Widget _personCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor().black, width: 2),
        // boxShadow: [
        //   BoxShadow(
        //       blurRadius: 4,
        //       spreadRadius: .4,
        //       color: AppColor().lightYellow,
        //       offset: Offset(0, 1))
        // ],
        color: AppColor().darkYellow,
      ),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: MediaQuery.sizeOf(context).height * .08,
              child: Image.asset("assets/images/logo.png"),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBasic(
                  text: AppStrings().personName,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                TextBasic(
                  text: AppStrings().personTitle,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
