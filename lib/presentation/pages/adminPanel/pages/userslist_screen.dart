import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class UserslistScreen extends StatelessWidget {
  final List<User> users;
  const UserslistScreen({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child:  Scaffold(
  resizeToAvoidBottomInset: false,            backgroundColor: AppColors.bgAppContent,
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
                      text: "Пользователи",
                      textStyle: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 2.h,
                  ),
                  users.isEmpty
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
                                        text: "Список пользователей пуст",
                                        textStyle: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 2.h),
                                    AppText(
                                        text:
                                            "На данный момент нет зарегистрированных пользователей на сайте.",
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
                              itemCount: users.length,
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
                                          text: users[index].userFL,
                                          textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold)),
                                      AppText(
                                          textAlign: TextAlign.left,
                                          text:
                                              '${users[index].username.isEmpty == 0 ? 'Без логина' : '@${users[index].username}'} | ID: ${users[index].idTg}',
                                          textStyle: TextStyle(
                                              fontSize: 10.sp,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                );
                              }))
                ]))));
  }
}
