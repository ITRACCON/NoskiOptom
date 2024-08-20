import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:shopsocks/common/widgets/appbar.dart';
import 'package:shopsocks/common/widgets/sidebar.dart';
import 'package:sizer/sizer.dart';

class ErrorContent extends StatelessWidget {
  final String title;
  final String text;
  final int userId;
  final String routname;
  final bool backPage;
  const ErrorContent(
      {super.key,
      required this.title,
      required this.text,
      required this.userId,
      required this.routname,
      this.backPage = false});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  resizeToAvoidBottomInset: false,        backgroundColor: AppColors.bgAppContent,
        appBar: CustomAppBar(
          userId: userId,
          back: backPage,
          onTapFavorite: () {
            Navigator.pushNamed(context, '/favorite');
          },
          onTapBasket: () {
            Navigator.pushNamed(context, '/basket');
          },
        ),
        drawer: Sidebar(routName: routname),
        body: Center(
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
                  text: title,
                  textStyle: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
            Container(
                width: 80.w,
                padding: EdgeInsets.only(top: 1.h),
                child: AppText(
                  text: text,
                  textStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
                ))
          ],
        )));
  }
}
