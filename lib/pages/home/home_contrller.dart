//控制器(用来实现业务逻辑)
import 'package:get/state_manager.dart';

class HomeContrller extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
    update();
  }
}
