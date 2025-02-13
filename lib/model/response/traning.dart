// To parse this JSON data, do
//
//     final trainingData = trainingDataFromJson(jsonString);

import 'dart:convert';

TrainingData trainingDataFromJson(String str) => TrainingData.fromJson(json.decode(str));

String trainingDataToJson(TrainingData data) => json.encode(data.toJson());

class TrainingData {
    String id;
    String nama;
    String namaTrainer;
    int kapasitas;
    int kapasitasTersisa;
    String tipe;
    String deskripsi;
    DateTime tanggal;
    int durasi;
    String status;

    TrainingData({
        required this.id,
        required this.nama,
        required this.namaTrainer,
        required this.kapasitas,
        required this.kapasitasTersisa,
        required this.tipe,
        required this.deskripsi,
        required this.tanggal,
        required this.durasi,
        required this.status,
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
        "tanggal": tanggal.toIso8601String(),
        "durasi": durasi,
        "status": status,
    };
}
