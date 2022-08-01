import 'package:clinic_app/doctors/doctor_controller.dart';
import 'package:clinic_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorView extends StatelessWidget {
  DoctorView({Key? key}) : super(key: key);
  final DoctorPageController doctorPageController =
      Get.put(DoctorPageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: ProjectPaddings.defaultPadding,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Obx(() => ListView.separated(
                itemCount: doctorPageController.doctorList.length,
                separatorBuilder: ((context, index) => const SizedBox(
                      height: 10,
                    )),
                itemBuilder: ((context, index) {
                  return ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            ProjectBorders.defaultBorderRadius)),
                    tileColor: ProjectColors.color3,
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          doctorPageController.doctorList[index].photo),
                    ),
                    title: Text(doctorPageController.doctorList[index].name),
                    subtitle:
                        Text(doctorPageController.doctorList[index].education),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                  );
                }))),
          ),
        ),
      ],
    );
  }
}
