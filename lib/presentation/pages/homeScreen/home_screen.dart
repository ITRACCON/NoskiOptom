import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/homeScreen/widgets/cards_category.dart';
import 'package:shopsocks/common/widgets/appbar.dart';
import 'package:shopsocks/common/widgets/sidebar.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
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
            drawer: Sidebar(routName: '/', userTg: user.idTg),
            body: ListView(children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                  child: Column(
                    children: [
                      CardsCategory(
                          onTap: () {
                            Navigator.pushNamed(context, '/catalog/muzhskie');
                          },
                          title: "Мужские носки",
                          imageBg: AppImages.bgCardMenSocks),
                      CardsCategory(
                          onTap: () {
                            Navigator.pushNamed(context, '/catalog/ledi');
                          },
                          title: "Женские носки",
                          imageBg: AppImages.bgCardLediSocks),
                      CardsCategory(
                          onTap: () {
                            Navigator.pushNamed(context, '/catalog/kid');
                          },
                          title: "Детские носки",
                          imageBg: AppImages.bgCardKidSocks),
                      CardsCategory(
                          onTap: () {
                            Navigator.pushNamed(context, '/catalog/winter');
                          },
                          title: "Зимние носки",
                          imageBg: AppImages.bgCardWinterSocks),
                    ],
                  ))
            ])));
  }
}
