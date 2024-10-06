import 'package:get/get.dart';

class VmBee extends GetxController {
  RxInt selectedBee = 0.obs;
  RxMap<int, List> beeValue = {
    0: [100, 70, 25, 38],
    1: [85, 35, 48, 38],
    2: [26, 21, 95, 38],
    3: [65, 60, 70, 25],
  }.obs;
}
