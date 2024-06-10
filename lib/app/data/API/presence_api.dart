import 'package:dio/dio.dart';
import 'package:flutter_application_absensi/app/data/api_client.dart';

class PresenceApi extends ApiClient {
  Future<Response> absenMasuk({
    required String accesstoken,
    required String usersId,
    required String lokasi,
    required String waktuAbsenMasuk,
  }) async {
    try {
      var response = await dio.post(
        '$baseUrl/pegawai/absen',
        data: {
          'users_id': usersId,
          'lokasi_user': lokasi,
          'waktu_absen_masuk': waktuAbsenMasuk,
          'tanggal_hari_ini': DateTime.now(),
        },
        options:
            Options(contentType: Headers.formUrlEncodedContentType, headers: {
          'Authorization': 'Bearer $accesstoken',
        }),
      );
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
