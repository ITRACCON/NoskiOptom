import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/info_content_screens.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:shopsocks/common/widgets/appbar.dart';
import 'package:shopsocks/common/widgets/card_list.dart';
import 'package:shopsocks/common/widgets/sidebar.dart';
import 'package:sizer/sizer.dart';

class DeliverlyScreen extends StatelessWidget {
  final User user;
  DeliverlyScreen({super.key, required this.user});

  Map infoPage = infoContentPage[Screens.deliverly];

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
          routName: '/deliverly',
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
                  CardList(
                      title: infoPage['infoPage']['firstBloc']['title'],
                      strList: infoPage['infoPage']['firstBloc']['list']),
                  SizedBox(height: 2.h),
                  CardList(
                      title: infoPage['infoPage']['twoBloc']['title'],
                      strList: infoPage['infoPage']['twoBloc']['list'])
                ],
              ))
        ]));
  }
}
