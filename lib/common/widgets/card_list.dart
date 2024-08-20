import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:shopsocks/common/widgets/bullet_list.dart';
import 'package:sizer/sizer.dart';

class CardList extends StatelessWidget {
  final String title;
  final List<String> strList;
  const CardList({super.key, required this.title, required this.strList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 1.h),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          AppText(
              text: title,
              textStyle:
                   TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 2.h,
          ),
          BulletList(strList),
        ],
      ),
    );
  }
}
