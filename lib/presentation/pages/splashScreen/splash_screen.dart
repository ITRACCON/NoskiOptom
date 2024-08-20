import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.2, vertical: 1.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.bgImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    AppImages.logo,
                    width: 40.w,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 1.h),
                    child: AppText(
                      text: "Оптом Носки",
                      textStyle: TextStyle(
                          fontSize: 24.sp,
                          color: AppColors.greenTitle,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                    padding: EdgeInsets.only(top: 1.h),
                    child: AppText(
                      text: "Мужские • Женские",
                      textStyle: TextStyle(
                          fontSize: 18.sp, color: AppColors.greenText),
                    )),
                AppText(
                  text: "Детские",
                  textStyle:
                      TextStyle(fontSize: 18.sp, color: AppColors.greenText),
                ),
                Container(
                    padding: EdgeInsets.only(top: 2.h),
                    child: const CircularProgressIndicator(
                      color: AppColors.greenTitle,
                      value: null,
                      strokeWidth: 5.0,
                    ))
              ],
            ))));
  }
}
