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
import 'package:url_launcher/url_launcher_string.dart';

class ContactScreen extends StatelessWidget {
  final User user;
  ContactScreen({super.key, required this.user});

  Map infoPage = infoContentPage[Screens.contact];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.bgAppContent,
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
          routName: '/contact',
        ),
        body: ListView(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
              child: Column(children: [
                AppText(
                    text: infoPage['title'],
                    textStyle: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 2.h,
                ),
                AppText(
                    text: infoPage['infoPage']['firstBloc']['title'],
                    textStyle: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 1.h,
                ),
                AppText(
                    text: infoPage['infoPage']['firstBloc']['text'],
                    textStyle: TextStyle(fontSize: 14.sp)),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                    child: Column(
                      children: [
                        ListTile(
                            leading: Icon(
                              Icons.phone_in_talk_rounded,
                              size: 14.sp,
                              color: AppColors.greenTitle,
                            ),
                            title: InkWell(
                                onTap: () {
                                  launchUrlString(
                                      "tel://${infoPage['infoPage']['twoBloc']['firstPhone'].toString().replaceAll('-', '').replaceAll(' ', '').replaceAll('()', '').replaceAll(')', '')}");
                                },
                                child: AppText(
                                    textAlign: TextAlign.left,
                                    text: infoPage['infoPage']['twoBloc']
                                        ['firstPhone'],
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 12.sp)))),
                        ListTile(
                            leading: Icon(
                              Icons.phone_in_talk_rounded,
                              size: 14.sp,
                              color: AppColors.greenTitle,
                            ),
                            title: InkWell(
                                onTap: () {
                                  launchUrlString(
                                      "tel://${infoPage['infoPage']['twoBloc']['twoPhone'].toString().replaceAll('-', '').replaceAll(' ', '').replaceAll('()', '').replaceAll(')', '')}");
                                },
                                child: AppText(
                                    textAlign: TextAlign.left,
                                    text: infoPage['infoPage']['twoBloc']
                                        ['twoPhone'],
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 12.sp)))),
                        ListTile(
                            leading: Icon(
                              Icons.email_rounded,
                              size: 14.sp,
                              color: AppColors.greenTitle,
                            ),
                            title: AppText(
                                textAlign: TextAlign.left,
                                text: infoPage['infoPage']['twoBloc']['email'],
                                textStyle: TextStyle(
                                    color: AppColors.black, fontSize: 12.sp))),
                        ListTile(
                            leading: Icon(
                              Icons.maps_home_work_rounded,
                              size: 14.sp,
                              color: AppColors.greenTitle,
                            ),
                            title: InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      "https://yandex.ru/maps/org/optom_noski_muzhskiye_zhenskiye_detskiye/217693968912/?ll=37.615942%2C55.644777&utm_campaign=v1&utm_medium=rating&utm_source=badge&z=13"));
                                },
                                child: AppText(
                                    textAlign: TextAlign.left,
                                    text: infoPage['infoPage']['twoBloc']
                                        ['adress'],
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 12.sp)))),
                        ListTile(
                          leading: Icon(
                            Icons.timer_rounded,
                            size: 14.sp,
                            color: AppColors.greenTitle,
                          ),
                          title: AppText(
                              textAlign: TextAlign.left,
                              text: 'Время работы',
                              textStyle: TextStyle(
                                  color: AppColors.black, fontSize: 12.sp)),
                          subtitle: AppText(
                              textAlign: TextAlign.left,
                              text: infoPage['infoPage']['twoBloc']['timeWork'],
                              textStyle: TextStyle(
                                  color: AppColors.black, fontSize: 12.sp)),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        AppText(
                            text: 'Мессенджеры и соцсети',
                            textStyle: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    infoPage['infoPage']['twoBloc']['vkUrl']));
                              },
                              child: Image.asset(
                                AppImages.vkLogo,
                                width: 15.w,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    infoPage['infoPage']['twoBloc']['tgUrl']));
                              },
                              child: Image.asset(
                                AppImages.tgLogo,
                                width: 15.w,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    infoPage['infoPage']['twoBloc']['waUrl']));
                              },
                              child: Image.asset(
                                AppImages.waLogo,
                                width: 15.w,
                              ),
                            )
                          ],
                        )
                      ],
                    ))
              ]))
        ]));
  }
}
