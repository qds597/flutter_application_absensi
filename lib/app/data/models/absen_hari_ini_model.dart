// To parse this JSON data, do
//
//     final absenHariIniModel = absenHariIniModelFromJson(jsonString);

import 'dart:convert';

AbsenHariIniModel absenHariIniModelFromJson(String str) =>
    AbsenHariIniModel.fromJson(json.decode(str));

String absenHariIniModelToJson(AbsenHariIniModel data) =>
    json.encode(data.toJson());

class AbsenHariIniModel {
  bool? success;
  Data? data;
  String? message;

  AbsenHariIniModel({
    this.success,
    this.data,
    this.message,
  });

  factory AbsenHariIniModel.fromJson(Map<String, dynamic> json) =>
      AbsenHariIniModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  String? usersId;
  String? lokasiUser;
  String? waktuAbsenMasuk;
  String? tanggalHariIni;
  String? status;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Data({
    this.usersId,
    this.lokasiUser,
    this.waktuAbsenMasuk,
    this.tanggalHariIni,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        usersId: json["users_id"],
        lokasiUser: json["lokasi_user"],
        waktuAbsenMasuk: json["waktu_absen_masuk"],
        tanggalHariIni: json["tanggal_hari_ini"],
        status: json["status"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "users_id": usersId,
        "lokasi_user": lokasiUser,
        "waktu_absen_masuk": waktuAbsenMasuk,
        "tanggal_hari_ini": tanggalHariIni,
        "status": status,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
