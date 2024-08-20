import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/utils/constants/info_content_screens.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/fulfimentScreen/card_advantages.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:shopsocks/common/widgets/appbar.dart';
import 'package:shopsocks/common/widgets/sidebar.dart';
import 'package:sizer/sizer.dart';

class FulfimentScreen extends StatelessWidget {
  final User user;
  FulfimentScreen({super.key, required this.user});

  Map infoPage = infoContentPage[Screens.fulfilment];

  @override
  Widget build(BuildContext context) {
    print(infoPage);
    return  Scaffold(
  resizeToAvoidBottomInset: false,        backgroundColor: AppColors.bgAppContent,
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
          routName: '/fulfilment',
        ),
        body: ListView(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
              child: Column(
                children: [
                  AppText(
                      text: infoPage['title'],
                      textStyle: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.h, vertical: 3.w),
                      width: 90.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.greenTitle.withOpacity(0.7)),
                      child: Column(children: [
                        AppText(
                            text: infoPage['infoPage']['firstCard']
                                ['firstText'],
                            textStyle: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold)),
                        AppText(
                            text: infoPage['infoPage']['firstCard']['twoText'],
                            textStyle: TextStyle(
                                fontSize: 12.sp, color: AppColors.white)),
                        AppText(
                            text: infoPage['infoPage']['firstCard']
                                ['threeText'],
                            textStyle: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold)),
                      ])),
                  SizedBox(
                    height: 1.h,
                  ),
                  AppText(
                      text: infoPage['infoPage']['firstBloc']['title'],
                      textStyle: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.black.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic)),
                  SizedBox(
                    height: 2.h,
                  ),
                  AppText(
                      text: infoPage['infoPage']['firstBloc']['text'],
                      textStyle: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.h, vertical: 3.w),
                      width: 90.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.greenTitle.withOpacity(0.7)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                    text: infoPage['infoPage']['twoCard']
                                        ['firstText'],
                                    textStyle: TextStyle(
                                        fontSize: 16.sp,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold)),
                                AppText(
                                    text: infoPage['infoPage']['twoCard']
                                        ['twoText'],
                                    textStyle: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            AppText(
                                text: infoPage['infoPage']['twoCard']
                                    ['threeText'],
                                textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold)),
                          ])),
                  SizedBox(
                    height: 2.h,
                  ),
                  AppText(
                      text: infoPage['infoPage']['twoBloc']['title'],
                      textStyle: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 1.h,
                  ),
                  CardAdvantages(
                      image: AppImages.sroki,
                      title: infoPage['infoPage']['twoBloc']['cards'][0]
                          ['title'],
                      text: infoPage['infoPage']['twoBloc']['cards'][0]
                          ['text']),
                  SizedBox(
                    height: 1.h,
                  ),
                  CardAdvantages(
                      image: AppImages.rashodi,
                      title: infoPage['infoPage']['twoBloc']['cards'][1]
                          ['title'],
                      text: infoPage['infoPage']['twoBloc']['cards'][1]['text'])
                ],
              ))
        ]));
  }
}
