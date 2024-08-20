import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/order_model.dart';
import 'package:shopsocks/common/widgets/accordion.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class OrderlistScreen extends StatelessWidget {
  final List<OrderUser> orders;
  const OrderlistScreen({super.key, required this.orders});

  getSumaOrder(index) {
    double sumaOrder = 0;
    orders[index]
        .order
        .forEach((order) => sumaOrder += order.amount * order.product!.price);
    return sumaOrder;
  }

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
                      text: "Заказы",
                      textStyle: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 2.h,
                  ),
                  orders.isEmpty
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
                                        text: "Список заказов пуст",
                                        textStyle: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 2.h),
                                    AppText(
                                        text:
                                            "Пока нет оформленных заказов. Следите за активностью пользователей и ожидайте новых заказов.",
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
                              itemCount: orders.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 0.5.h),
                                  width: 90.w,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 1.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                          textAlign: TextAlign.left,
                                          text: "№ Заказа",
                                          textStyle: TextStyle(
                                              fontSize: 10.sp,
                                              color: Colors.grey)),
                                      AppText(
                                          textAlign: TextAlign.left,
                                          text: orders[index].orderId,
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
                                                  fontWeight: FontWeight.bold)),
                                          AppText(
                                              textAlign: TextAlign.left,
                                              text: orders[index].userFL,
                                              textStyle:
                                                  TextStyle(fontSize: 11.sp)),
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
                                                  fontWeight: FontWeight.bold)),
                                          AppText(
                                              textAlign: TextAlign.left,
                                              text: orders[index]
                                                      .userName
                                                      .isEmpty
                                                  ? 'Без логина'
                                                  : '@${orders[index].userName}',
                                              textStyle:
                                                  TextStyle(fontSize: 11.sp)),
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
                                                  fontWeight: FontWeight.bold)),
                                          AppText(
                                              textAlign: TextAlign.left,
                                              text: orders[index]
                                                  .order
                                                  .length
                                                  .toString(),
                                              textStyle:
                                                  TextStyle(fontSize: 11.sp)),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                              textAlign: TextAlign.left,
                                              text: 'Сумма заказа',
                                              textStyle: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.bold)),
                                          AppText(
                                              textAlign: TextAlign.left,
                                              text:
                                                  '${getSumaOrder(index).toString()} ₽',
                                              textStyle:
                                                  TextStyle(fontSize: 11.sp)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Accordion(
                                          title: 'Подробнее о заказе',
                                          child: Column(
                                            children: orders[index]
                                                .order
                                                .map((order) {
                                              return Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5),
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
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                          AppText(
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              text:
                                                                  '${order.amount} пар',
                                                              textStyle:
                                                                  TextStyle(
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
                                          ))
                                    ],
                                  ),
                                );
                              }))
                ]))));
  }
}
