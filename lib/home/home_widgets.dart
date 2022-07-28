import 'package:flutter/material.dart';

import '../utilities/utilities.dart';
import 'home_controller.dart';

Container customNavBar(BuildContext context, HomeController homeController,
    PageController pageController) {
  return Container(
    height: 60,
    decoration: const BoxDecoration(
      color: ProjectColors.color3,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _bottomBarIconButton(0, Icons.home_outlined, Icons.home_filled,
            homeController, pageController),
        _bottomBarIconButton(1, Icons.person_outlined, Icons.person,
            homeController, pageController),
        _bottomBarIconButton(2, Icons.apartment_outlined, Icons.apartment,
            homeController, pageController),
        _bottomBarIconButton(3, Icons.photo_outlined, Icons.photo,
            homeController, pageController),
      ],
    ),
  );
}

IconButton _bottomBarIconButton(int index, IconData icon, IconData iconfilled,
    HomeController homeController, PageController pageController) {
  return IconButton(
    enableFeedback: false,
    onPressed: () {
      homeController.pageIndex.value = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    },
    icon: homeController.pageIndex.value == index
        ? Icon(
            iconfilled,
            color: ProjectColors.color1,
            size: 35,
          )
        : Icon(
            icon,
            color: ProjectColors.color2,
            size: 35,
          ),
  );
}

class CustomFAT extends StatelessWidget {
  const CustomFAT({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () {},
      child: Container(
        height: 55,
        width: 55,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment(0.7, -0.5),
            end: Alignment(0.6, 0.5),
            colors: [
              ProjectColors.color1,
              ProjectColors.color2,
            ],
          ),
        ),
        child: const Icon(
          Icons.add,
          size: 30,
          color: ProjectColors.color3,
        ),
      ),
    );
  }
}
