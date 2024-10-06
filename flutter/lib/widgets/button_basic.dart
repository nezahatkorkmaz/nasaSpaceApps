import 'package:deneme/constants/app_color.dart';
import 'package:deneme/widgets/text_basic.dart';
import 'package:flutter/material.dart';

class MiniButtonBasic extends StatelessWidget {
  const MiniButtonBasic({super.key, required this.title, required this.ontap});
  final String title;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: MediaQuery.sizeOf(context).width * .25,
          decoration: BoxDecoration(
              color: AppColor().lightYellow,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            child: TextBasic(
              text: title,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
