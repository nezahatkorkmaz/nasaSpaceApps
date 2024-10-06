import 'package:deneme/constants/app_color.dart';
import 'package:deneme/constants/strings.dart';
import 'package:deneme/widgets/text_basic.dart';
import 'package:flutter/material.dart';

class ViewPerson extends StatelessWidget {
  const ViewPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _personCard(context),
        ],
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
