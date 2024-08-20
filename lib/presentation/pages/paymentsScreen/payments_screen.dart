import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/utils/constants/info_content_screens.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/paymentsScreen/cards_oplata.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:shopsocks/common/widgets/appbar.dart';
import 'package:shopsocks/common/widgets/card_list.dart';
import 'package:shopsocks/common/widgets/sidebar.dart';
import 'package:sizer/sizer.dart';

class PaymentsScreen extends StatelessWidget {
  final User user;
  PaymentsScreen({super.key, required this.user});

  Map infoPage = infoContentPage[Screens.payments];

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
          routName: '/oplata',
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
                  AppText(
                      text: infoPage['infoPage']['firstBloc']['title'],
                      textStyle: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  CardWayPayment(
                      text: infoPage['infoPage']['firstBloc']['cards'][0],
                      image: AppImages.sberLogo),
                  CardWayPayment(
                      text: infoPage['infoPage']['firstBloc']['cards'][1],
                      image: AppImages.bank),
                  CardWayPayment(
                    text: infoPage['infoPage']['firstBloc']['cards'][2],
                    image: AppImages.deliverly,
                  ),
                  AppText(
                      text: infoPage['infoPage']['twoBloc']['title'],
                      textStyle: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 2.h,
                  ),
                  CardList(
                      title: infoPage['infoPage']['twoBloc']['cards'][0]
                          ['title'],
                      strList: infoPage['infoPage']['twoBloc']['cards'][0]
                          ['list']),
                  SizedBox(
                    height: 1.h,
                  ),
                  CardList(
                      title: infoPage['infoPage']['twoBloc']['cards'][1]
                          ['title'],
                      strList: infoPage['infoPage']['twoBloc']['cards'][1]
                          ['list']),
                  SizedBox(
                    height: 1.h,
                  ),
                  CardList(
                      title: infoPage['infoPage']['twoBloc']['cards'][2]
                          ['title'],
                      strList: infoPage['infoPage']['twoBloc']['cards'][2]
                          ['list'])
                ],
              ))
        ]));
  }
}
