import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class CardAdvantages extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const CardAdvantages(
      {super.key,
      required this.image,
      required this.title,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 27.h,
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.only(top: 1.h, right: 1.w),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  alignment: Alignment.bottomLeft,
                  width: 18.h,
                  height: 18.h,
                  decoration: BoxDecoration(
                      color: AppColors.greenText.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(70),
                          topRight: Radius.circular(70),
                          bottomRight: Radius.circular(70)))),
              Image.asset(
                image,
                width: 22.w,
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(bottom: 1.h),
                  width: 25.h,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.greenText.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: AppText(
                                text: title,
                                textAlign: TextAlign.left,
                                textStyle: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white))),
                        AppText(
                            text: text,
                            textAlign: TextAlign.left,
                            textStyle: TextStyle(fontSize: 11.sp))
                      ])))
        ],
      ),
    );
  }
}
