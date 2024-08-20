import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class CardWayPayment extends StatelessWidget {
  final String image;
  final String text;
  const CardWayPayment({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.only(top: 1.h, right: 1.w),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  alignment: Alignment.bottomLeft,
                  width: 12.h,
                  height: 12.h,
                  decoration: BoxDecoration(
                      color: AppColors.greenText.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(70),
                          topRight: Radius.circular(70),
                          bottomRight: Radius.circular(70)))),
              Image.asset(
                image,
                width: 18.w,
              )
            ],
          ),
          Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(bottom: 1.h),
              width: 60.w,
              child: AppText(
                  text: text,
                  textAlign: TextAlign.left,
                  textStyle:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}
