// To parse this JSON data, do
//
//     final doctor = doctorFromJson(jsonString);

import 'dart:convert';

List<Doctor> doctorFromJson(String str) =>
    List<Doctor>.from(json.decode(str).map((x) => Doctor.fromJson(x)));

String doctorToJson(List<Doctor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Doctor {
  Doctor({
    required this.id,
    required this.name,
    required this.gender,
    required this.department,
    required this.description,
    required this.education,
    required this.photo,
  });

  String id;
  String name;
  String gender;
  String department;
  String description;
  String education;
  String photo;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        name: json["name"],
        gender: json["gender"],
        department: json["department"],
        description: json["description"],
        education: json["education"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
        "department": department,
        "description": description,
        "education": education,
        "photo": photo,
      };
}
