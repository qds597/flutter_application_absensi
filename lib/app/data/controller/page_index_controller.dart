import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage(int index) async {
    pageIndex.value = index;
    switch (index) {
      case 1:
        Get.offAllNamed(Routes.ABSEN);
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