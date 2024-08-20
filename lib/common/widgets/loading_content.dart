import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:shopsocks/common/widgets/appbar.dart';
import 'package:shopsocks/common/widgets/sidebar.dart';
import 'package:sizer/sizer.dart';

class LoadingContent extends StatelessWidget {
  final String title;
  final String text;
  final int userId;
  final String routname;
  final bool backPage;
  const LoadingContent(
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
        drawer: const Sidebar(routName: '/loading'),
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
