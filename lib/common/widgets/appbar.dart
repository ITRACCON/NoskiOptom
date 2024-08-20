import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/presentation/cubit/appBarCubit/appbar_cubit.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final void Function() onTapFavorite;
  final void Function() onTapBasket;
  final bool back;
  final int userId;
  const CustomAppBar(
      {super.key,
      this.height = kToolbarHeight,
      required this.onTapFavorite,
      required this.onTapBasket,
      this.back = false,
      required this.userId});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  late AppBarCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = AppBarCubit()..initialAppBar(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    cubit.initialAppBar(widget.userId);
    return AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: Builder(builder: (context) {
          return widget.back
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded, size: 18.sp),
                )
              : IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu_rounded, size: 18.sp),
                );
        }),
        title: InkWell(
            onTap: () => Navigator.pushNamed(context, '/'),
            child: SizedBox(
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
                ))),
        actions: [
          BlocBuilder<AppBarCubit, AppBarState>(
              bloc: cubit,
              builder: (context, state) {
                return state.when(
                    initial: (bool basketIsEmpty, bool favoriteIsEmpty) =>
                        ActionsWidgets(
                            colorActionFavorite: !favoriteIsEmpty
                                ? Colors.transparent
                                : AppColors.greenTitle,
                            colorActionBasket: !basketIsEmpty
                                ? Colors.transparent
                                : AppColors.greenTitle,
                            onTapBasket: widget.onTapBasket,
                            onTapFavorite: widget.onTapFavorite),
                    loading: () => ActionsWidgets(
                        colorActionFavorite: Colors.blue,
                        colorActionBasket: Colors.blue,
                        onTapBasket: widget.onTapBasket,
                        onTapFavorite: widget.onTapFavorite),
                    error: () => ActionsWidgets(
                        colorActionFavorite: Colors.red,
                        colorActionBasket: Colors.red,
                        onTapBasket: widget.onTapBasket,
                        onTapFavorite: widget.onTapFavorite));
              })
        ]);
  }
}

class ActionsWidgets extends StatelessWidget {
  final void Function() onTapFavorite;
  final void Function() onTapBasket;
  final Color colorActionFavorite;
  final Color colorActionBasket;

  const ActionsWidgets(
      {super.key,
      required this.onTapFavorite,
      required this.onTapBasket,
      required this.colorActionFavorite,
      required this.colorActionBasket});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      InkWell(
        onTap: () {
          onTapFavorite();
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Icon(Icons.favorite_border_rounded, size: 18.sp),
                Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: colorActionFavorite,
                        borderRadius: BorderRadius.circular(10)))
              ],
            )),
      ),
      InkWell(
        onTap: () {
          onTapBasket();
        },
        child: Container(
            padding: EdgeInsets.only(right: 5.w, left: 2.w),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Icon(Icons.shopping_bag_outlined, size: 18.sp),
                Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: colorActionBasket,
                        borderRadius: BorderRadius.circular(10)))
              ],
            )),
      )
    ]);
  }
}
