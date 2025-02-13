// To parse this JSON data, do
//
//     final registerForm = registerFormFromJson(jsonString);

import 'dart:convert';

RegisterForm registerFormFromJson(String str) => RegisterForm.fromJson(json.decode(str));

String registerFormToJson(RegisterForm data) => json.encode(data.toJson());

class RegisterForm {
    String username;
    String password;
    String nama;
    DateTime tglLahir;
    String pekerjaan;
    String perusahaan;
    String noTelepon;
    String email;

    RegisterForm({
        required this.username,
        required this.password,
        required this.nama,
        required this.tglLahir,
        required this.pekerjaan,
        required this.perusahaan,
        required this.noTelepon,
        required this.email,
    });

    factory RegisterForm.fromJson(Map<String, dynamic> json) => RegisterForm(
        username: json["username"],
        password: json["password"],
        nama: json["nama"],
        tglLahir: DateTime.parse(json["tgl_lahir"]),
        pekerjaan: json["pekerjaan"],
        perusahaan: json["perusahaan"],
        noTelepon: json["no_telepon"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "nama": nama,
        "tgl_lahir": "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
        "pekerjaan": pekerjaan,
        "perusahaan": perusahaan,
        "no_telepon": noTelepon,
        "email": email,
    };
}
