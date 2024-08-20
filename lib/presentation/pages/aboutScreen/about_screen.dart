import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/info_content_screens.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:shopsocks/common/widgets/appbar.dart';
import 'package:shopsocks/common/widgets/card_list.dart';
import 'package:shopsocks/common/widgets/sidebar.dart';
import 'package:sizer/sizer.dart';

class AboutScreen extends StatelessWidget {
  final User user;
  AboutScreen({super.key, required this.user});

  Map infoPage = infoContentPage[Screens.about];
  @override
  Widget build(BuildContext context) {
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
        drawer: const Sidebar(routName: '/about'),
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
                Container(
                    width: 90.w,
                    padding:
                        EdgeInsets.symmetric(vertical: 2.w, horizontal: 1.h),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(children: [
                      AppText(
                          text: infoPage['infoPage']['firstBloc']['title'],
                          textStyle: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 2.h,
                      ),
                      AppText(
                          text: infoPage['infoPage']['firstBloc']['text'],
                          textStyle: TextStyle(fontSize: 12.sp))
                    ])),
                SizedBox(
                  height: 2.h,
                ),
                CardList(
                    title: infoPage['infoPage']['twoBloc']['title'],
                    strList: infoPage['infoPage']['twoBloc']['list']),
                SizedBox(
                  height: 2.h,
                ),
                CardList(
                    title: infoPage['infoPage']['threeBloc']['title'],
                    strList: infoPage['infoPage']['threeBloc']['list']),
              ]))
        ]));
  }
}
