import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/pages/home/home_binding.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
// ignore: unused_import

import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: AppRoutes.Home,
        page: () => MyApp15(),
        customTransition: SizeTransitions(),
        binding: HomeBinding())
  ];
}

class SizeTransitions extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return Align(
      alignment: Alignment.center,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animation,
          curve: curve!,
        ),
        child: child,
      ),
    );
  }
}
