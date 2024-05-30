import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_absensi/app/data/API/profil_perusahaan_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../api_client.dart';
import '../models/profil_perusahaan_model.dart';

class AuthController extends GetxController {
  final storage = const FlutterSecureStorage();
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;
  String? currentToken;
  String? currentEmail;

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  Future firstinitialized() async {
    currentToken = await storage.read(key: 'access_token');
    currentEmail = await storage.read(key: 'email');
    if (currentToken != null) {
      await getProfilePerusahaan(token: currentToken!);
    }
  }

  Future login() async {
    try {
      print('login');
      isLoading.value = true;
      var res = await ApiClient().login(
        emailC.text,
        passwordC.text,
      );
      isLoading.value = false;
      if (res.data['success'] == true) {
        await storage.write(
            key: 'access_token', value: res.data['access_token']);
        await storage.write(key: 'email', value: res.data['email']);
        currentToken = await storage.read(key: 'access_token');
        currentEmail = await storage.read(key: 'email');
        Get.offAllNamed(
          Routes.HOME,
        );
        Get.rawSnackbar(
          messageText: Text(res.data['message']),
          backgroundColor: Colors.green.shade300,
        );
      } else {
        Get.rawSnackbar(
          messageText: Text(res.data['message'].toString()),
          backgroundColor: Colors.red.shade300,
        );
      }
    } catch (error) {
      isLoading.value = false;
      Get.rawSnackbar(message: error.toString());
    }
  }

  Future logout() async {
    try {
      isLoading.value = true;
      var res = await ApiClient().logout(accesstoken: currentToken!);
      isLoading.value = false;
      if (res.data['success'] == true) {
        await storage.delete(key: 'access_token');
        await storage.delete(key: 'email');
        currentToken = null;
        currentEmail = null;
        Get.offAllNamed(Routes.LOGIN);
        Get.rawSnackbar(
          messageText: Text(res.data['message']),
          backgroundColor: Colors.green.shade300,
        );
      } else {
        Get.rawSnackbar(
          messageText: Text(res.data['message'].toString()),
          backgroundColor: Colors.red.shade300,
        );
      }
    } catch (error) {
      isLoading.value = false;
      Get.rawSnackbar(message: error.toString());
    }
  }
}

ProfilPerusahaanModel profilPerusahaanModel = ProfilPerusahaanModel();

Future<ProfilPerusahaanModel> getProfilePerusahaan(
    {required String token}) async {
  try {
    var res = await ProfilePerusahaanApi().getProfilePerusahaan(
      accesstoken: token,
    );
    if (res.data['success'] == true) {
      print(res.data);
      profilPerusahaanModel = profilPerusahaanModelFromJson(res.data);
      return profilPerusahaanModel;
    } else {
      Get.rawSnackbar(
        messageText: Text(res.data['message'].toString()),
        backgroundColor: Colors.red.shade300,
      );
      return profilPerusahaanModel;
    }
  } catch (e) {
    Get.rawSnackbar(
      messageText: Text(e.toString()),
      backgroundColor: Colors.red.shade300,
    );
    return profilPerusahaanModel;
  }
}
