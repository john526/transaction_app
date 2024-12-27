import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationComponent extends StatelessWidget {
  final String lottie;
  LottieAnimationComponent({super.key, required this.lottie});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      child: Center(
        child: Lottie.asset(lottie),
      ),
    );
  }
}

