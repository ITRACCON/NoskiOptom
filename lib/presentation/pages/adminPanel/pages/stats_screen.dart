import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/order_model.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/adminPanel/pages/dashboard.dart';
import 'package:shopsocks/presentation/pages/adminPanel/widgets/error_content.dart';
import 'package:shopsocks/presentation/pages/adminPanel/widgets/loading_content.dart';
import 'package:shopsocks/presentation/cubit/adminCubit/admin_cubit.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:shopsocks/common/widgets/error_content.dart';
import 'package:shopsocks/common/widgets/loading_content.dart';
import 'package:sizer/sizer.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  late AdminCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = AdminCubit()..initState();
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
                  onPressed: () async {
                    Navigator.pop(context, true);
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
            body: BlocBuilder<AdminCubit, AdminState>(
                bloc: cubit,
                builder: (context, state) {
                  return state.when(
                    initialStats: (List<User> users, List<OrderUser> orders,
                            List<BasketProductStats> basketProductStat) =>
                        Dashboard(
                            users: users,
                            orderUsers: orders,
                            basketProductStat: basketProductStat),
                    initial: () => Container(),
                    loading: () => const AdminLoadingContent(
                      title: 'Загрузка',
                      text: '',
                    ),
                    error: (String error) => const AdminErrorContent(
                        title: 'Ошибка загрузки данных',
                        text:
                            'Извините, возникла проблема при загрузке данных о сайте. Пожалуйста, повторите попытку.'),
                    success: () {
                      return Container();
                    },
                    initialMassAdd: (Map<dynamic, dynamic> init) => Container(),
                    initEditProduct: (Product product) => Container(),
                  );
                })));
  }
}
