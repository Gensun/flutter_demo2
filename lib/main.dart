import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home/home_contrller.dart';
import 'package:flutter_application_2/pages/home/home_view.dart';
import 'package:flutter_application_2/router/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

void main() => runApp(GetMaterialApp(
    initialRoute: '/home',
    defaultTransition: Transition.native,
    translations: MyTranslations(),
    locale: const Locale('pt', 'BR'),
    getPages: AppPages.routes)); //runApp(MaterialApp(home: MyApp15()));

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'title': 'Hello World %s',
        },
        'en_US': {
          'title': 'Hello World from US',
        },
        'pt': {
          'title': 'Olá de Portugal %s',
        },
        'pt_BR': {
          'title': 'Olá do Brasil %s',
        },
      };
}

class MyApp15 extends StatelessWidget {
  final controller = Get.find<HomeContrller>();

  @override
  Widget build(BuildContext context) {
    return const Home();
    //  MaterialApp(
    //   title: 'getX',
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text("title".trArgs(['John'])),
    //     ),
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           GetX<HomeContrller>(
    //               builder: (_) => Text('Clicks: ${controller.count}')),
    //           Obx(() => Text('Clicks: ${controller.count}')),
    //           ElevatedButton(
    //             onPressed: () => Get.to(() => Second()), //Get.to(Second()),
    //             child: const Text('Next Route'),
    //           )
    //         ],
    //       ),
    //     ),
    //     floatingActionButton: FloatingActionButton(
    //       child: const Icon(Icons.add),
    //       onPressed: () => controller.increment(),
    //     ),
    //   ),
    // );
  }
}

class Second extends StatelessWidget {
  final HomeContrller ctrl = Get.find();
  @override
  Widget build(context) {
    return Scaffold(body: Center(child: Text("${ctrl.count}")));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var count = 0.obs;

  _incrementCounter() {
    count++;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetX',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => Text("$count")),
            ElevatedButton(
                onPressed: () {
                  // Get.to(Second());
                },
                child: const Text('Next Route'))
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
