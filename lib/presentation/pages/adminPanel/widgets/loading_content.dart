import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:shopsocks/common/widgets/appbar.dart';
import 'package:shopsocks/common/widgets/sidebar.dart';
import 'package:sizer/sizer.dart';

class AdminLoadingContent extends StatelessWidget {
  final String title;
  final String text;
  const AdminLoadingContent({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  resizeToAvoidBottomInset: false,        backgroundColor: AppColors.bgAppContent,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18.sp,
              ),
            );
          }),
          title: SizedBox(
              width: 50.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText(
                      text: 'Оптом',
                      textStyle: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.greenTitle,
                          fontWeight: FontWeight.bold)),
                  Image.asset(
                    AppImages.logo,
                    width: 10.w,
                  ),
                  AppText(
                      text: 'Носки',
                      textStyle: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.greenTitle,
                          fontWeight: FontWeight.bold)),
                ],
              )),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(top: 2.h),
                child: const CircularProgressIndicator(
                  color: AppColors.greenTitle,
                  value: null,
                  strokeWidth: 5.0,
                )),
            AppText(
                text: title,
                textStyle: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold)),
            Container(
                width: 80.w,
                padding: EdgeInsets.only(top: 1.h),
                child: AppText(
                  text: text,
                  textStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
                ))
          ],
        )));
  }
}
