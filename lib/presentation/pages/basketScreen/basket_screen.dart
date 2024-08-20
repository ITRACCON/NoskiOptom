import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/basketScreen/widgets/basket_content.dart';
import 'package:shopsocks/presentation/cubit/appBarCubit/appbar_cubit.dart';
import 'package:shopsocks/common/widgets/appbar.dart';

class BasketScreen extends StatelessWidget {
  final List<BasketProduct> basket;
  final void Function(String productID, int amount) addAmountBasketProduct;
  final void Function(String productID, int amount) minusAmountBasketProduct;
  final void Function(String productID) remuveProductBasket;
  final User user;
  final AppBarCubit appBarCubit;
  const BasketScreen(
      {super.key,
      required this.user,
      required this.basket,
      required this.addAmountBasketProduct,
      required this.minusAmountBasketProduct,
      required this.remuveProductBasket,
      required this.appBarCubit});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.bgAppContent,
            appBar: CustomAppBar(
              back: true,
              userId: user.idTg,
              onTapFavorite: () {
                Navigator.pushNamed(context, '/favorite');
              },
              onTapBasket: () {
                Navigator.pushNamed(context, '/basket');
              },
            ),
            body: basket.isEmpty
                ? const BasketEmptyContent()
                : BasketContent(
                    basket: basket,
                    addAmountBasketProduct: (productID, amount) =>
                        addAmountBasketProduct(productID, amount),
                    minusAmountBasketProduct: (productID, amount) =>
                        minusAmountBasketProduct(productID, amount),
                    remuveProductBasket: (productID) =>
                        remuveProductBasket(productID),
                    user: user,
                  )));
  }
}
