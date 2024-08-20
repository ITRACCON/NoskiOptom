import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class CardsCategory extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final String imageBg;
  const CardsCategory(
      {super.key,
      required this.onTap,
      required this.title,
      required this.imageBg});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 1.h),
            height: 60.h,
            width: 90.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(imageBg),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter),
            ),
            child: Container(
              width: 90.w,
              padding: EdgeInsets.symmetric(vertical: 1.h),
              color: AppColors.black.withOpacity(0.5),
              child: AppText(
                text: title,
                textStyle: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
            )));
  }
}
