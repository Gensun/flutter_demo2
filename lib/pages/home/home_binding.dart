//控制器绑定(用来绑定controller到view)

import 'package:get/instance_manager.dart';

import 'home_contrller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeContrller());
  }
}
