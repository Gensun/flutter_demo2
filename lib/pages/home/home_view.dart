//视图(用来实现页面布局)
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home/home_contrller.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class Home extends GetView<HomeContrller> {
  const Home({super.key});

  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: const Text("counter")),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text("${controller.count}")),
            ElevatedButton(
              onPressed: () => Get.defaultDialog(
                  onConfirm: () {
                    Get.back();
                  },
                  onCancel: () {}),
              child: Text('显示弹框'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar("Snackbar 标题", "欢迎使用Snackbar");
              },
              child: Text("显示 Snackbar"),
            ),
            ElevatedButton(
              child: Text('BottomSheets'),
              onPressed: () {
                Get.bottomSheet(
                    Container(
                      child: Wrap(
                        children: [
                          ListTile(
                              leading: Icon(Icons.abc,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black),
                              title: Text('Music'),
                              onTap: () {
                                Get.changeTheme(ThemeData.light());
                                Get.back();
                              }),
                          ListTile(
                            leading: Icon(Icons.baby_changing_station),
                            title: Text('Video'),
                            onTap: () =>
                                {Get.changeTheme(ThemeData.dark()), Get.back()},
                          )
                        ],
                      ),
                      // color: Colors.amber,
                    ),
                    backgroundColor: Colors.limeAccent);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // ignore: sort_child_properties_last
        child: const Icon(Icons.add),
        onPressed: controller.increment,
      ));
}
