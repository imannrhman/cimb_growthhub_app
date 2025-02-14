// To parse this JSON data, do
//
//     final trainingData = trainingDataFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

TrainingData trainingDataFromJson(String str) => TrainingData.fromJson(json.decode(str));

String trainingDataToJson(TrainingData data) => json.encode(data.toJson());

class TrainingData {
    String? id;
    String? nama;
    String? namaTrainer;
    int? kapasitas;
    int? kapasitasTersisa;
    String? tipe;
    String? deskripsi;
    DateTime? tanggal;
    int? durasi;
    String? status;

    TrainingData({
         this.id,
         this.nama,
         this.namaTrainer,
         this.kapasitas,
        this.kapasitasTersisa = 0,
         this.tipe,
         this.deskripsi,
         this.tanggal,
         this.durasi,
         this.status,
    });

    factory TrainingData.fromJson(Map<String, dynamic> json) => TrainingData(
        id: json["id"],
        nama: json["nama"],
        namaTrainer: json["nama_trainer"],
        kapasitas: json["kapasitas"],
        kapasitasTersisa: json["kapasitas_tersisa"],
        tipe: json["tipe"],
        deskripsi: json["deskripsi"],
        tanggal: DateTime.parse(json["tanggal"]),
        durasi: json["durasi"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "nama_trainer": namaTrainer,
        "kapasitas": kapasitas,
        "kapasitas_tersisa": kapasitasTersisa,
        "tipe": tipe,
        "deskripsi": deskripsi,
        "tanggal": tanggal?.toIso8601String() ?? "",
        "durasi": durasi,
        "status": status,
    };

    TrainingData copyWith({
        String? id,
        String? nama,
        String? namaTrainer,
        int? kapasitas,
        int? kapasitasTersisa,
        String? tipe,
        String? deskripsi,
        DateTime? tanggal,
        int? durasi,
        String? status,
    }) {
        return TrainingData(
            id: id ?? this.id,
            nama: nama ?? this.nama,
            namaTrainer: namaTrainer ?? this.namaTrainer,
            kapasitas: kapasitas ?? this.kapasitas,
            kapasitasTersisa: kapasitasTersisa ?? this.kapasitasTersisa,
            tipe: tipe ?? this.tipe,
            deskripsi:deskripsi ?? this.deskripsi,
            tanggal: tanggal ?? this.tanggal,
            durasi: durasi ?? this.durasi,
            status: status ?? this.status,

        );
    }

}
