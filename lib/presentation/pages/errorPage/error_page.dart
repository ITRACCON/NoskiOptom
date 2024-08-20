import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.2, vertical: 1.h),
            decoration: const BoxDecoration(
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
                Image.asset(
                  AppImages.error404,
                  width: 70.w,
                ),
                SizedBox(
                    width: 80.w,
                    child: AppText(
                      text: "Ошибка авторизации",
                      textStyle: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                    padding: EdgeInsets.only(top: 1.h),
                    width: 80.w,
                    child: AppText(
                      text:
                          "Извините, произошла ошибка при авторизацииб Пожалуйста, повторите попытку сейчас или позже",
                      textStyle:
                          TextStyle(fontSize: 14.sp, color: Colors.black),
                    ))
              ],
            ))));
  }
}
