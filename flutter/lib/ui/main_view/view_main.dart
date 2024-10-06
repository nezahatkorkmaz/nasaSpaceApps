import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:deneme/constants/app_color.dart';
import 'package:deneme/constants/strings.dart';
import 'package:deneme/ui/bee_view/view_bee.dart';
import 'package:deneme/ui/home_view/view_home.dart';
import 'package:deneme/ui/home_view/vm_home.dart';
import 'package:deneme/ui/main_view/vm_main.dart';
import 'package:deneme/ui/person_view/view_person.dart';
import 'package:deneme/widgets/text_basic.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final class ViewMain extends StatefulWidget {
  @override
  _ViewMainState createState() => _ViewMainState();
}

class _ViewMainState extends State<ViewMain> {
  VmMain vmMain = VmMain();
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List pages = [];
  @override
  void initState() {
    super.initState();
    pages.add(ViewBee());
    pages.add(ViewHome());
    pages.add(ViewPerson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().navyBlue,
      appBar: AppBar(
        backgroundColor: AppColor().darkYellow,
        title: Text(
          AppStrings().appBarTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: pages[vmMain.selectedPage],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: AppColor().navyBlue,
        height: kToolbarHeight,
        key: _bottomNavigationKey,
        items: <Widget>[
          Image.asset(
            "assets/icons/bee.png",
            width: 28,
            height: 28,
          ),
          Image.asset(
            "assets/icons/barn.png",
            width: 40,
            height: 40,
          ),
          Image.asset(
            "assets/icons/person.png",
            width: 28,
            height: 28,
          ),
        ],
        onTap: (index) {
          setState(() {
            vmMain.selectedPage = index;
          });
        },
      ),

      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(
      //       icon: Image.asset(
      //         "assets/icons/bee.png",
      //         width: 28,
      //         height: 28,
      //       ),
      //       label: ""),
      //   BottomNavigationBarItem(
      //       icon: Image.asset(
      //         "assets/icons/barn.png",
      //         width: 40,
      //         height: 40,
      //       ),
      //       label: ""),
      //   BottomNavigationBarItem(
      //       icon: Image.asset(
      //         "assets/icons/person.png",
      //         width: 28,
      //         height: 28,
      //       ),
      //       label: "")
      // ]),
    );
  }
}
