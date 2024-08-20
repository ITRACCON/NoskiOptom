import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/utils/constants/info_content_screens.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:shopsocks/common/widgets/appbar.dart';
import 'package:shopsocks/common/widgets/sidebar.dart';
import 'package:sizer/sizer.dart';

import 'package:url_launcher/url_launcher.dart';

class ProducionScreen extends StatelessWidget {
  final User user;
  ProducionScreen({super.key, required this.user});

  Map infoPage = infoContentPage[Screens.production];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF6F7F8),
        appBar: CustomAppBar(
          userId: user.idTg,
          onTapFavorite: () {
            Navigator.pushNamed(context, '/favorite');
          },
          onTapBasket: () {
            Navigator.pushNamed(context, '/basket');
          },
        ),
        drawer: const Sidebar(
          routName: '/production',
        ),
        body: ListView(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText(
                        text: infoPage['title'],
                        textStyle: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 2.h,
                    ),
                    AppText(
                        text: infoPage['infoPage']['firstBloc']['text'],
                        textStyle: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.greenText, width: 2.sp)),
                          child: AppText(
                              text: infoPage['infoPage']['firstBloc']['cards']
                                  [0],
                              textStyle: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.greenText)),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.greenText, width: 2.sp)),
                          child: AppText(
                              text: infoPage['infoPage']['firstBloc']['cards']
                                  [1],
                              textStyle: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.greenText)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.greenText, width: 2.sp)),
                          child: AppText(
                              text: infoPage['infoPage']['firstBloc']['cards']
                                  [2],
                              textStyle: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.greenText)),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.greenText, width: 2.sp)),
                          child: AppText(
                              text: infoPage['infoPage']['firstBloc']['cards']
                                  [3],
                              textStyle: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.greenText)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.greenText, width: 2.sp)),
                      child: AppText(
                          text: infoPage['infoPage']['firstBloc']['cards'][4],
                          textStyle: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.greenText)),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(
                              infoPage['infoPage']['firstBloc']['tgUrl']));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.greenTitle),
                          child: AppText(
                              text: 'Рассчитать стоимость',
                              textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white)),
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 90.w,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 1.h),
                              alignment: Alignment.center,
                              width: 90.w,
                              decoration: const BoxDecoration(
                                  color: AppColors.greenTitle,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: AppText(
                                text: infoPage['infoPage']['twoBloc']['cards']
                                    [0]['title'],
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white),
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.w, horizontal: 1.h),
                            child: AppText(
                              text: infoPage['infoPage']['twoBloc']['cards'][0]
                                  ['text'],
                              textStyle: TextStyle(
                                  fontSize: 12.sp, color: AppColors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 90.w,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 1.h),
                              alignment: Alignment.center,
                              width: 90.w,
                              decoration: const BoxDecoration(
                                  color: AppColors.greenTitle,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: AppText(
                                text: infoPage['infoPage']['twoBloc']['cards']
                                    [1]['title'],
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white),
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.w, horizontal: 1.h),
                            child: AppText(
                              text: infoPage['infoPage']['twoBloc']['cards'][1]
                                  ['text'],
                              textStyle: TextStyle(
                                  fontSize: 12.sp, color: AppColors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      width: 90.w,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 1.h),
                              alignment: Alignment.center,
                              width: 90.w,
                              decoration: const BoxDecoration(
                                  color: AppColors.greenTitle,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: AppText(
                                text: infoPage['infoPage']['twoBloc']['cards']
                                    [2]['title'],
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white),
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.w, horizontal: 1.h),
                            child: AppText(
                              text: infoPage['infoPage']['twoBloc']['cards'][2]
                                  ['text'],
                              textStyle: TextStyle(
                                  fontSize: 12.sp, color: AppColors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 90.w,
                      padding:
                          EdgeInsets.symmetric(vertical: 2.w, horizontal: 1.h),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          AppText(
                              text: infoPage['infoPage']['threeBloc']['title'],
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black)),
                          SizedBox(
                            height: 1.h,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                AppImages.proiszvodstvo,
                                width: 88.w,
                              )),
                          SizedBox(
                            height: 1.h,
                          ),
                          AppText(
                              text: infoPage['infoPage']['threeBloc']['text'],
                              textStyle: TextStyle(
                                  fontSize: 12.sp, color: AppColors.black)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AppText(
                        text: infoPage['infoPage']['fourBloc']['title'],
                        textStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                        width: 90.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 2.w, horizontal: 1.h),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: AppColors.greenText, width: 2.sp)),
                              child: AppText(
                                  text: '1',
                                  textStyle: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greenText)),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                                child: AppText(
                                    textAlign: TextAlign.left,
                                    text: infoPage['infoPage']['fourBloc']
                                        ['cards'][0],
                                    textStyle: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.greenText)))
                          ],
                        )),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                        width: 90.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 2.w, horizontal: 1.h),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: AppColors.greenText, width: 2.sp)),
                              child: AppText(
                                  text: '2',
                                  textStyle: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greenText)),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                                child: AppText(
                                    textAlign: TextAlign.left,
                                    text: infoPage['infoPage']['fourBloc']
                                        ['cards'][1],
                                    textStyle: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.greenText)))
                          ],
                        )),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                        width: 90.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 2.w, horizontal: 1.h),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: AppColors.greenText, width: 2.sp)),
                              child: AppText(
                                  text: '3',
                                  textStyle: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greenText)),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                                child: AppText(
                                    textAlign: TextAlign.left,
                                    text: infoPage['infoPage']['fourBloc']
                                        ['cards'][2],
                                    textStyle: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.greenText)))
                          ],
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                        width: 90.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 2.w, horizontal: 1.h),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: AppColors.greenText, width: 2.sp)),
                              child: AppText(
                                  text: '4',
                                  textStyle: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greenText)),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                                child: AppText(
                                    textAlign: TextAlign.left,
                                    text: infoPage['infoPage']['fourBloc']
                                        ['cards'][3],
                                    textStyle: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.greenText)))
                          ],
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                        width: 90.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 2.w, horizontal: 1.h),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: AppColors.greenText, width: 2.sp)),
                              child: AppText(
                                  text: '5',
                                  textStyle: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greenText)),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                                child: AppText(
                                    textAlign: TextAlign.left,
                                    text: infoPage['infoPage']['fourBloc']
                                        ['cards'][4],
                                    textStyle: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.greenText)))
                          ],
                        )),
                  ]))
        ]));
  }
}
