import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:shopsocks/common/widgets/appbar.dart';
import 'package:shopsocks/common/widgets/sidebar.dart';
import 'package:sizer/sizer.dart';

class SuccessOreder extends StatelessWidget {
  final int userId;

  const SuccessOreder({super.key, required this.userId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.bgAppContent,
        appBar: CustomAppBar(
          userId: userId,
          back: false,
          onTapFavorite: () {
            Navigator.pushNamed(context, '/favorite');
          },
          onTapBasket: () {
            Navigator.pushNamed(context, '/basket');
          },
        ),
        drawer: Sidebar(routName: ''),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.successOrder, width: 60.w),
            Container(
                width: 80.w,
                padding: EdgeInsets.only(top: 2.h),
                child: AppText(
                  text:
                      'Ваш заказ успешно оформлен. Ожидайте подтверждения и информацию о доставке на указанный вами контактный номер.',
                  textStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
                ))
          ],
        )));
  }
}
