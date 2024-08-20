import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/presentation/pages/adminPanel/pages/add_massproducts_screen.dart';
import 'package:shopsocks/presentation/pages/adminPanel/pages/add_product_screen.dart';
import 'package:shopsocks/presentation/pages/adminPanel/pages/edit_delete_product_screen.dart';
import 'package:shopsocks/presentation/pages/adminPanel/pages/stats_screen.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

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
                height: 90.h,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      AppText(
                          text: 'Админ панель',
                          textStyle: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.greenTitle)),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 1.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white),
                        child: Column(
                          children: [
                            InkWell(
                                onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const StatsScreen()),
                                    ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 10),
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.greenTitle),
                                  child: AppText(
                                      text: 'Статистика',
                                      textStyle: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white)),
                                )),
                            InkWell(
                                onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddProductScreen()),
                                    ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 10),
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.greenTitle),
                                  child: AppText(
                                      text: 'Добавить товар',
                                      textStyle: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white)),
                                )),
                            InkWell(
                                onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddMassproductsScreen()),
                                    ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 10),
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.greenTitle),
                                  child: AppText(
                                      text: 'Массовое добавление товаров',
                                      textStyle: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white)),
                                )),
                            InkWell(
                                onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EditDeleteProductScreen()),
                                    ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 10),
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.greenTitle),
                                  child: AppText(
                                      text: 'Редактирование/Удаление товаров',
                                      textStyle: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white)),
                                )),
                            InkWell(
                                onTap: () => Navigator.pushNamed(context, '/'),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 10),
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.greenTitle),
                                  child: AppText(
                                      text: 'Перейти в магазин',
                                      textStyle: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white)),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      AppText(
                          text: 'Ver. 1.1.3',
                          textStyle:
                              TextStyle(fontSize: 10.sp, color: Colors.grey))
                    ])))));
  }
}
