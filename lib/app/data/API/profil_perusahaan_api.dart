import 'package:dio/dio.dart';
import 'package:flutter_application_absensi/app/data/api_client.dart';
import 'package:get/get.dart';

class ProfilePerusahaanApi extends ApiClient {
  Future<Response> getProfilePerusahaan({required String accesstoken}) async {
    try {
      var response = await dio.get(
        '$baseUrl/pegawai/profile_perusahaan/1',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $accesstoken',
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
