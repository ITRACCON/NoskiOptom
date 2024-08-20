import 'package:flutter/material.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class Input extends StatelessWidget {
  final Color backgroundInput;
  final Color borderInput;
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLength;
  final bool readOnly;
  const Input(
      {super.key,
      required this.backgroundInput,
      required this.borderInput,
      required this.title,
      required this.controller,
      required this.keyboardType,
      required this.maxLength,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
              textAlign: TextAlign.left,
              text: title,
              textStyle: TextStyle(fontSize: 10.sp)),
          SizedBox(
            height: 0.5.h,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: backgroundInput,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: borderInput, width: 2)),
            child: TextFormField(
              readOnly: readOnly,
              maxLines: maxLength,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                fillColor: Colors.grey,
                hintText: '',
                counterText: '',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintStyle: TextStyle(
                    color: Color(0xff999999),
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp),
              ),
              controller: controller,
            ),
          )
        ]);
  }
}
