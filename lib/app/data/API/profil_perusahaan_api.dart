import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../api_client.dart';

class ProfilePerusahaanApi extends ApiClient {
  Future <Response> getProfilPerusahaan({required String accesstoken}) async {
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