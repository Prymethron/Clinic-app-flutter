import 'package:clinic_app/doctors/doctor_services.dart';
import 'package:get/get.dart';

import 'doctor_model.dart';

class DoctorPageController extends GetxController {
  var doctorList = <Doctor>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    isLoading(true);
    try {
      DoctorServices doctorServices = DoctorServices();
      doctorList.value = await doctorServices.getAllDoctors();
    } finally {
      isLoading.value = false;
    }
    update();
  }
}
