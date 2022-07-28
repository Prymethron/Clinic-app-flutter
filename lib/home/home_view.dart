import 'package:clinic_app/contact/contact_view.dart';
import 'package:clinic_app/departments/departments_view.dart';
import 'package:clinic_app/doctors/doctors_view.dart';
import 'package:clinic_app/home/home_controller.dart';
import 'package:clinic_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = Get.put(HomeController());
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Clinic',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          homeController.pageIndex.value = index;
        },
        children: const [
          HomePageBody(),
          DoctorView(),
          DepartmentsView(),
          ContactView()
        ],
      ),
      floatingActionButton: const CustomFAT(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          Obx(() => customNavBar(context, homeController, pageController)),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to Clinic',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return const SizedBox(
                  width: 300,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    color: ProjectColors.color2,
                  ),
                );
              })),
        ),
      ],
    );
  }
}
