// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
    String id;
    String username;
    String roleId;
    DateTime createdAt;
    DateTime updatedAt;
    Role role;
    Profile profile;

    UserProfile({
        required this.id,
        required this.username,
        required this.roleId,
        required this.createdAt,
        required this.updatedAt,
        required this.role,
        required this.profile,
    });

    factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        username: json["username"],
        roleId: json["role_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        role: Role.fromJson(json["role"]),
        profile: Profile.fromJson(json["profile"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "role_id": roleId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "role": role.toJson(),
        "profile": profile.toJson(),
    };
}

class Profile {
    String id;
    String userId;
    String nama;
    DateTime tglLahir;
    String pekerjaan;
    String perusahaan;
    String noTelepon;
    String email;
    DateTime createdAt;
    DateTime updatedAt;

    Profile({
        required this.id,
        required this.userId,
        required this.nama,
        required this.tglLahir,
        required this.pekerjaan,
        required this.perusahaan,
        required this.noTelepon,
        required this.email,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        userId: json["user_id"],
        nama: json["nama"],
        tglLahir: DateTime.parse(json["tgl_lahir"]),
        pekerjaan: json["pekerjaan"],
        perusahaan: json["perusahaan"],
        noTelepon: json["no_telepon"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "nama": nama,
        "tgl_lahir": "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
        "pekerjaan": pekerjaan,
        "perusahaan": perusahaan,
        "no_telepon": noTelepon,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Role {
    String id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;

    Role({
        required this.id,
        required this.name,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
