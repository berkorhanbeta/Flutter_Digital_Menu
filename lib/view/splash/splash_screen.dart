import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_menu/api/controller/controller.dart';
import 'package:qr_menu/util/images.dart';
import 'dart:async';
import 'package:qr_menu/util/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  Controller controller = Get.find<Controller>();


  @override
  void initState() {
    super.initState();

    _route();

  }

  @override
  void dispose() {
    super.dispose();

  }

  // After 3 Second
  // Open Home Page
  Future<void> _route() async {
    controller.getCategories().then((value) async {
      //controller.beverageCategory!.forEach((element) {print("Beverage : ${element.catTitle}");});
      Timer(const Duration(seconds: 1), () async {
        Get.offAndToNamed(RouteHelper.home);
      });
    });
  }


  // Splash Screen View
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _globalKey,
      body: Stack(
        children: [
                Image.asset(
                  Images.logo,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,),
        ],
      ),
    );
  }


}
