import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/order_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/adminPanel/pages/basketlist_screen.dart';
import 'package:shopsocks/presentation/pages/adminPanel/pages/orderlist_screen.dart';
import 'package:shopsocks/presentation/pages/adminPanel/pages/userslist_screen.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class Dashboard extends StatelessWidget {
  final List<User> users;
  final List<OrderUser> orderUsers;
  final List<BasketProductStats> basketProductStat;
  const Dashboard(
      {super.key,
      required this.users,
      required this.orderUsers,
      required this.basketProductStat});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          child: Column(children: [
            AppText(
                text: "Статистика",
                textStyle:
                    TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 2.h,
            ),
            Column(children: [
              Container(
                width: 90.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: AppColors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.purple.withOpacity(0.2)),
                          child: Icon(
                            Icons.people_alt_outlined,
                            size: 42.sp,
                            color: Colors.purple,
                          ),
                        ),
                        AppText(
                            textAlign: TextAlign.right,
                            text: users.length.toString(),
                            textStyle: TextStyle(
                                fontSize: 26.sp, fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    AppText(
                        textAlign: TextAlign.right,
                        text: 'Пользователей',
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                        ))
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserslistScreen(
                                users: users,
                              )),
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    width: 90.w,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.purple),
                    child: AppText(
                        text: 'Посмотреть список',
                        textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white)),
                  )),
            ]),
            SizedBox(
              height: 2.h,
            ),
            Column(children: [
              Container(
                width: 90.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: AppColors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green.withOpacity(0.2)),
                          child: Icon(
                            Icons.description_outlined,
                            size: 42.sp,
                            color: Colors.green,
                          ),
                        ),
                        AppText(
                            textAlign: TextAlign.right,
                            text: orderUsers.length.toString(),
                            textStyle: TextStyle(
                                fontSize: 26.sp, fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    AppText(
                        textAlign: TextAlign.right,
                        text: 'Заказов',
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                        ))
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderlistScreen(
                                orders: orderUsers,
                              )),
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    width: 90.w,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.green),
                    child: AppText(
                        text: 'Посмотреть список',
                        textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white)),
                  )),
            ]),
            SizedBox(
              height: 2.h,
            ),
            Column(children: [
              Container(
                width: 90.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: AppColors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blueAccent.withOpacity(0.2)),
                          child: Icon(
                            Icons.assignment_late_outlined,
                            size: 42.sp,
                            color: Colors.blueAccent,
                          ),
                        ),
                        AppText(
                            textAlign: TextAlign.right,
                            text: basketProductStat.length.toString(),
                            textStyle: TextStyle(
                                fontSize: 26.sp, fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    AppText(
                        textAlign: TextAlign.right,
                        text: 'Не оформленных заказов',
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                        ))
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BasketlistScreen(
                                basketProductStat: basketProductStat,
                              )),
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    width: 90.w,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.blueAccent),
                    child: AppText(
                        text: 'Посмотреть список',
                        textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white)),
                  )),
            ]),
          ]))
    ]);
  }
}
