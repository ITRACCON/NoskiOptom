import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class BulletList extends StatelessWidget {
  final List<String> strings;

  BulletList(this.strings);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: strings.map((str) {
        return ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          leading: AppText(
            text: '•',
            textStyle: TextStyle(
                fontSize: 32.sp,
                color: AppColors.greenTitle,
                fontWeight: FontWeight.bold),
          ),
          title: AppText(
            text: str,
            textAlign: TextAlign.left,
            textStyle: TextStyle(
              fontSize: 12.sp,
              color: AppColors.black,
            ),
          ),
        );
      }).toList(),
    );
  }
}
