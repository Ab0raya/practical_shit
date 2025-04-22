  import 'package:get/get.dart';

  class TabsController extends GetxController{
    var currentIndex = 0.obs;

    changeIndex({required int val}){
      currentIndex.value = val ;
    }

  }