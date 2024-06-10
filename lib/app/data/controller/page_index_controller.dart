import 'package:flutter_application_absensi/app/data/controller/presence_controller.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;
  final present = Get.find<PresenceController>();

  void changePage(int index) async {
    pageIndex.value = index;
    switch (index) {
      case 1:
        present.presence();
        break;
      case 2:
        Get.offAllNamed(Routes.PROFILE);
        break;
      default:
        Get.offAllNamed(Routes.HOME);
        break;
    }
  }
}
