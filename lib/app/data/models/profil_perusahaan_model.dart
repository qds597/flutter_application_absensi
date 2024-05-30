// To parse this JSON data, do
//
//     final profilPerusahaanModel = profilPerusahaanModelFromJson(jsonString);

import 'dart:convert';

ProfilPerusahaanModel profilPerusahaanModelFromJson(String str) =>
    ProfilPerusahaanModel.fromJson(json.decode(str));

String profilPerusahaanModelToJson(ProfilPerusahaanModel data) =>
    json.encode(data.toJson());

class ProfilPerusahaanModel {
  bool? success;
  Data? data;
  String? message;

  ProfilPerusahaanModel({
    this.success,
    this.data,
    this.message,
  });

  factory ProfilPerusahaanModel.fromJson(Map<String, dynamic> json) =>
      ProfilPerusahaanModel(
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
  int? id;
  String? namaPerusahaan;
  String? deskripsi;
  String? latitude;
  String? longitude;
  String? jamMasuk;
  String? jamPulang;
  dynamic image;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.namaPerusahaan,
    this.deskripsi,
    this.latitude,
    this.longitude,
    this.jamMasuk,
    this.jamPulang,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        namaPerusahaan: json["nama_perusahaan"],
        deskripsi: json["deskripsi"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        jamMasuk: json["jam_masuk"],
        jamPulang: json["jam_pulang"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_perusahaan": namaPerusahaan,
        "deskripsi": deskripsi,
        "latitude": latitude,
        "longitude": longitude,
        "jam_masuk": jamMasuk,
        "jam_pulang": jamPulang,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
