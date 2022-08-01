import 'dart:convert';

import 'package:clinic_app/doctors/doctor_model.dart';
import 'package:flutter/services.dart';

class DoctorServices {
  Future<List<Doctor>> getAllDoctors() async {
    final String response = await rootBundle.loadString('assets/doctors.json');
    final data = await jsonDecode(response);
    return (data as List).map((e) => Doctor.fromJson(e)).toList();
  }
}
