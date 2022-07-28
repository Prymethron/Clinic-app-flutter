import 'package:get/get.dart';

class HomeController extends GetxController {
  var pageIndex = 0.obs;
  var isLoading = true.obs;

  void changePageIndex(int index) {
    pageIndex.value = index;
  }
}
