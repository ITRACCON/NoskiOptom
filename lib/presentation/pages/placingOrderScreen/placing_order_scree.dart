import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/placingOrderScreen/widgets/order_content.dart';
import 'package:shopsocks/common/widgets/appbar.dart';

class PlacingOrderScreen extends StatelessWidget {
  final User user;
  final List<BasketProduct> basketProducts;
  final void Function(String phone, String? deliverly, String? pay)
      placingOrder;
  const PlacingOrderScreen(
      {super.key,
      required this.user,
      required this.basketProducts,
      required this.placingOrder});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.bgAppContent,
            appBar: CustomAppBar(
              userId: user.idTg,
              back: true,
              onTapFavorite: () {
                Navigator.pushNamed(context, '/favorite');
              },
              onTapBasket: () {
                Navigator.pushNamed(context, '/basket');
              },
            ),
            body: LoaderOverlay(
                child: OrderContent(
                    basketProducts: basketProducts,
                    userId: user.idTg,
                    placingOrder:
                        (String phone, String? deliverly, String? pay) {
                      context.loaderOverlay.show();
                      placingOrder(phone, deliverly, pay);
                    }))));
  }
}
