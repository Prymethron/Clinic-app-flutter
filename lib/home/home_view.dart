import 'package:clinic_app/core/flavor/app_config.dart';
import 'package:clinic_app/departments/departments_view.dart';
import 'package:clinic_app/doctors/doctors_view.dart';
import 'package:clinic_app/gallery/gallery_view.dart';
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

  final pageList = [
    const HomePageBody(),
    DoctorView(),
    const DepartmentsView(),
    const GalleryView()
  ];

  late List appBarTitles = [
    (AppConfig.of(context).appDisplayName),
    'Doctors',
    '',
    'Gallery'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
              appBarTitles[homeController.pageIndex.value],
              style: Theme.of(context).textTheme.headline5,
            )),
      ),
      body: Obx(() => pageList[homeController.pageIndex.value]),
      // PageView(
      //   controller: pageController,
      //   onPageChanged: (index) {
      //     homeController.pageIndex.value = index;
      //   },
      //   children: [
      //     const HomePageBody(),
      //     DoctorView(),
      //     const DepartmentsView(),
      //     const ContactView()
      //   ],
      // ),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            'Welcome to Clinic',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              color: ProjectColors.color2lowOpacity,
              borderRadius:
                  BorderRadius.all(ProjectBorders.defaultBorderRadius)),
          margin: ProjectPaddings.defaultPadding,
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding: ProjectPaddings.defaultPadding + const EdgeInsets.all(5),
              child: RichText(
                text: TextSpan(
                    text: 'Description\n',
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      TextSpan(
                          style: Theme.of(context).textTheme.bodyMedium,
                          text:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                    ]),
              )),
        ),
        Container(
          margin: ProjectPaddings.defaultPadding,
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return SizedBox(
                  width: 300,
                  child: Card(
                    elevation: 2,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            ProjectBorders.defaultBorderRadius)),
                    color: ProjectColors.color2lowOpacity,
                    child: Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.center,
                        children: [
                          _getBorderedWidget(
                            Image.network(
                              _getImageUrl,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                          _getBorderedWidget(
                            Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                    ProjectColors.color2lowOpacity,
                                    Colors.transparent,
                                  ])),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Text('News',
                                style: Theme.of(context).textTheme.headline6),
                          ),
                        ]),
                  ),
                );
              })),
        ),
      ],
    );
  }

  ClipRRect _getBorderedWidget(Widget widget) {
    return ClipRRect(
        borderRadius:
            const BorderRadius.all(ProjectBorders.defaultBorderRadius),
        child: widget);
  }

  String get _getImageUrl =>
      "https://s.abcnews.com/images/Health/mdma-gty-er-180503_hpMain_16x9_1600.jpg";
}
