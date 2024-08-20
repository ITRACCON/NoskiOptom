import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class Sidebar extends StatelessWidget {
  final String routName;
  final int userTg;
  const Sidebar({super.key, required this.routName, this.userTg = 0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7.w, horizontal: 3.h),
        child: Column(
          children: [
            MenuButton(
              icon: Icons.home_outlined,
              title: 'Главная',
              routNameActive: routName,
              routName: '/',
            ),
            MenuButton(
              icon: Icons.business_center_outlined,
              title: 'Производство',
              routNameActive: routName,
              routName: '/production',
            ),
            MenuButton(
              icon: Icons.delivery_dining_outlined,
              title: 'Доставка',
              routNameActive: routName,
              routName: '/deliverly',
            ),
            MenuButton(
              icon: Icons.payment_outlined,
              title: 'Оплата',
              routNameActive: routName,
              routName: '/oplata',
            ),
            MenuButton(
              icon: Icons.supervisor_account_outlined,
              title: 'О нас',
              routNameActive: routName,
              routName: '/about',
            ),
            MenuButton(
              icon: Icons.home_outlined,
              title: 'Фулфилмент',
              routNameActive: routName,
              routName: '/fulfilment',
            ),
            MenuButton(
              icon: Icons.home_outlined,
              title: 'Контакты',
              routNameActive: routName,
              routName: '/contact',
            ),
            SizedBox(
              height: 4.h,
            ),
            AppText(
                text: 'ver. 1.1',
                textStyle: TextStyle(fontSize: 10.sp, color: Colors.grey))
          ],
        ),
      ),
    ));
  }
}

class MenuButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final String routNameActive;
  final String routName;
  const MenuButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.routNameActive,
      required this.routName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, routName);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: routNameActive == routName
                            ? AppColors.greenTitle.withOpacity(0.2)
                            : AppColors.black.withOpacity(0.05),
                      ),
                      child: Icon(
                        icon,
                        size: 18.sp,
                        color: routNameActive == routName
                            ? AppColors.greenTitle
                            : AppColors.black,
                      )),
                  SizedBox(
                    width: 2.w,
                  ),
                  AppText(
                      text: title,
                      textStyle: TextStyle(
                          color: routNameActive == routName
                              ? AppColors.greenTitle
                              : AppColors.black,
                          fontSize: 18.sp))
                ],
              ),
              Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 24.sp,
                color: routNameActive == routName
                    ? AppColors.greenTitle
                    : AppColors.black,
              )
            ],
          ),
        ));
  }
}
