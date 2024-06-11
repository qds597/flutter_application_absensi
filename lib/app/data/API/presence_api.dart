import 'package:dio/dio.dart';
import 'package:flutter_application_absensi/app/data/api_client.dart';
import 'package:intl/intl.dart';

class PresenceApi extends ApiClient {
  Future<Response> absenMasuk({
    required String accesstoken,
    required String usersId,
    required String lokasi,
    required String waktuAbsenMasuk,
  }) async {
    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
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

  Future<Response> cekAbsenHariIni({
    required String accesstoken,
    required String usersId,
    required String waktuHariIni,
  }) async {
    try {
      var response = await dio.get(
        '$baseUrl/cek_absen_hari_ini/$usersId/$waktuHariIni',
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

  Future<Response> absenHistory({
    required String accesstoken,
    required String usersId,
  }) async {
    try {
      var response = await dio.get(
        '$baseUrl/absen_history/$usersId',
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
