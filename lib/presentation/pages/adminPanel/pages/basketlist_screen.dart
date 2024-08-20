import 'package:flutter/material.dart';
import 'package:shopsocks/common/widgets/accordion.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class BasketlistScreen extends StatelessWidget {
  final List<BasketProductStats> basketProductStat;
  const BasketlistScreen({super.key, required this.basketProductStat});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.bgAppContent,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              leading: Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18.sp,
                  ),
                );
              }),
              title: SizedBox(
                  width: 50.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                          text: 'Оптом',
                          textStyle: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.greenTitle,
                              fontWeight: FontWeight.bold)),
                      Image.asset(
                        AppImages.logo,
                        width: 10.w,
                      ),
                      AppText(
                          text: 'Носки',
                          textStyle: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.greenTitle,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
            ),
            body: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                child: Column(children: [
                  AppText(
                      text: "Неоформленные заказы",
                      textStyle: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 2.h,
                  ),
                  basketProductStat.isEmpty
                      ? ListView(children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 3.h),
                            height: 85.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      AppImages.favoritEmpty,
                                      width: 75.w,
                                    ),
                                    SizedBox(height: 2.h),
                                    AppText(
                                        text:
                                            "Неоформленные заказы отсутствуют",
                                        textStyle: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 2.h),
                                    AppText(
                                        text:
                                            "Все заказы на сайте успешно оформлены. Продолжайте следить за новыми заказами и обрабатывайте их вовремя.",
                                        textStyle: TextStyle(fontSize: 14.sp)),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ])
                      : Expanded(
                          child: ListView.builder(
                              padding: const EdgeInsets.all(8),
                              itemCount: basketProductStat.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: basketProductStat[index]
                                              .username
                                              .isEmpty
                                          ? EdgeInsets.symmetric(
                                              vertical: 0.5.h)
                                          : EdgeInsets.only(top: 0.5.h),
                                      width: 90.w,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3.w, vertical: 1.h),
                                      decoration: BoxDecoration(
                                          borderRadius: basketProductStat[index]
                                                  .username
                                                  .isEmpty
                                              ? BorderRadius.circular(10)
                                              : const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10)),
                                          color: AppColors.white),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                              textAlign: TextAlign.left,
                                              text: "ID пользователя",
                                              textStyle: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: Colors.grey)),
                                          AppText(
                                              textAlign: TextAlign.left,
                                              text: basketProductStat[index]
                                                  .userId
                                                  .toString(),
                                              textStyle: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.greenTitle)),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AppText(
                                                  textAlign: TextAlign.left,
                                                  text: 'Покупатель',
                                                  textStyle: TextStyle(
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              AppText(
                                                  textAlign: TextAlign.left,
                                                  text: basketProductStat[index]
                                                      .userfl,
                                                  textStyle: TextStyle(
                                                      fontSize: 11.sp)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AppText(
                                                  textAlign: TextAlign.left,
                                                  text: 'Логин тг',
                                                  textStyle: TextStyle(
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              AppText(
                                                  textAlign: TextAlign.left,
                                                  text: basketProductStat[index]
                                                          .username
                                                          .isEmpty
                                                      ? 'Без логина'
                                                      : '@${basketProductStat[index].username}',
                                                  textStyle: TextStyle(
                                                      fontSize: 11.sp)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AppText(
                                                  textAlign: TextAlign.left,
                                                  text: 'Количество товаров',
                                                  textStyle: TextStyle(
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              AppText(
                                                  textAlign: TextAlign.left,
                                                  text: basketProductStat[index]
                                                      .amountBasket
                                                      .toString(),
                                                  textStyle: TextStyle(
                                                      fontSize: 11.sp)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Accordion(
                                              title: 'Товары',
                                              child: Column(
                                                children:
                                                    basketProductStat[index]
                                                        .order
                                                        .map((order) {
                                                  return Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5),
                                                      color: AppColors.white,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                  child: AppText(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      text: order
                                                                          .product!
                                                                          .title,
                                                                      textStyle: TextStyle(
                                                                          fontSize: 11
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.bold))),
                                                              AppText(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  text:
                                                                      '${order.amount} пар',
                                                                  textStyle: TextStyle(
                                                                      fontSize:
                                                                          11.sp)),
                                                              const Divider(
                                                                height: 5,
                                                                color: AppColors
                                                                    .greyText,
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ));
                                                }).toList(),
                                              )),
                                        ],
                                      ),
                                    ),
                                    basketProductStat[index].username.isEmpty
                                        ? Container()
                                        : InkWell(
                                            onTap: () {
                                              launchUrl(Uri.parse(
                                                  'https://t.me/${basketProductStat[index].username}'));
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7,
                                                      horizontal: 10),
                                              width: 90.w,
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10)),
                                                  color: AppColors.greenTitle),
                                              child: AppText(
                                                  text: 'Связаться',
                                                  textStyle: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColors.white)),
                                            ))
                                  ],
                                );
                              }))
                ]))));
  }
}
