import 'package:intl/intl.dart';

import '../API/presence_api.dart';
import '../models/absen_hari_ini_model.dart';

Future<AbsenHariIniModel> getCekAbsenHariIni() async {
  try {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    var res = await PresenceApi().cekAbsenHariIni(
      accesstoken: authC.currentToken!,
      usersId: authC.currentUserId!,
      waktuHariIni: formatted,
    );
    if (res.data['success'] == true) {
      authC.absenHariIniModel = AbsenHariIniModel.fromJson(res.data);
      return authC.absenHariIniModel;
    } else {
      Get.rawSnackbar(
          messageText: Text(res.data['message'].toString()),
          backgroundColor: Colors.red.shade300);
      return authC.absenHariIniModel;
    }
  } catch (e) {
    Get.rawSnackbar(
        messageText: Text(e.toString()), backgroundColor: Colors.red.shade300);
    return authC.absenHariIniModel;
  }
}