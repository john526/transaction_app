import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction_app/presentation/controllers/splash/splash.controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   SplashController splashController = Get.find();

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      splashController.getToken();
    });
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/png/achat-social-removebg-preview.png"),
      ),
    );
  }
}