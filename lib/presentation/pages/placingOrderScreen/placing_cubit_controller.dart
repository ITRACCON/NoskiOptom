import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/cubit/orderCubit/order_cubit.dart';
import 'package:shopsocks/presentation/pages/placingOrderScreen/placing_order_scree.dart';
import 'package:shopsocks/presentation/pages/placingOrderScreen/widgets/success_oreder.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:shopsocks/common/widgets/error_content.dart';
import 'package:shopsocks/common/widgets/loading_content.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;

class PlacingOrderCubitControllerScreen extends StatefulWidget {
  final User user;
  final List<BasketProduct> basketProducts;
  const PlacingOrderCubitControllerScreen(
      {super.key, required this.user, required this.basketProducts});

  @override
  State<PlacingOrderCubitControllerScreen> createState() =>
      _PlacingOrderCubitControllerScreenState();
}

class _PlacingOrderCubitControllerScreenState
    extends State<PlacingOrderCubitControllerScreen> {
  late OrderCubit cubit;
  final WebAppInitData webAppInitData = tg.initDataUnsafe;
  @override
  void initState() {
    super.initState();
    cubit = OrderCubit()..init();
  }

  @override
  void dispose() {
    widget.basketProducts.clear();
    super.dispose();
  }

  placingOrder(String phone, String? deliverly, String? pay) {
    cubit.placingOrder(
        webAppInitData.user?.id ?? 0,
        widget.basketProducts,
        '${webAppInitData.user?.first_name ?? ''} ${webAppInitData.user?.last_name ?? ''}',
        webAppInitData.user?.username ?? '',
        phone,
        deliverly ?? '',
        pay ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
        bloc: cubit,
        builder: (context, state) {
          return state.when(
              init: () => PlacingOrderScreen(
                  basketProducts: widget.basketProducts,
                  user: widget.user,
                  placingOrder:
                      (String phone, String? deliverly, String? pay) =>
                          placingOrder(phone, deliverly, pay)),
              placingOrderSuccess: () => SuccessOreder(
                    userId: widget.user.idTg,
                  ),
              placingOrderError: () => ErrorContent(
                    routname: '/order',
                    userId: widget.user.idTg,
                    title: 'Ошибка оформления заказа',
                    text:
                        'Извините, возникла проблема при оформлении вашего заказа. Пожалуйста, попробуйте снова или обратитесь в службу поддержки.',
                  ),
              placingOrderLoading: () => LoadingContent(
                    routname: '/order',
                    userId: widget.user.idTg,
                    title: 'Загрузка...',
                    text:
                        'Мы загружаем страницу оформления заказа. Скоро вы сможете завершить покупку.',
                  ));
        });
  }
}
