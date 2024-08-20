import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/favorite_product.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/productScreen/widgets/product_screen_content.dart';
import 'package:shopsocks/common/widgets/appbar.dart';

class ProductScreen extends StatelessWidget {
  final Product? product;
  final BasketProduct basketProduct;
  final FavoriteProduct favoriteProduct;
  final void Function(String productID, int amount) addProductBasket;
  final void Function(String productID, int amount) addAmountBasketProduct;
  final void Function(String productID, int amount) minusAmountBasketProduct;
  final void Function(String productID) remuveProductBasket;
  final void Function(String productID) addProductFavorite;
  final void Function(String productID) remuveProductFavorite;
  final void Function() refreshPage;
  final User user;
  const ProductScreen(
      {super.key,
      required this.product,
      required this.user,
      required this.basketProduct,
      required this.favoriteProduct,
      required this.addProductBasket,
      required this.addAmountBasketProduct,
      required this.minusAmountBasketProduct,
      required this.remuveProductBasket,
      required this.addProductFavorite,
      required this.remuveProductFavorite,
      required this.refreshPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.bgAppContent,
      appBar: CustomAppBar(
        back: true,
        userId: user.idTg,
        onTapFavorite: () {
          Navigator.pushNamed(context, '/favorite').then((res) {
            if (res == true) {
              refreshPage();
            }
          });
        },
        onTapBasket: () {
          Navigator.pushNamed(context, '/basket').then((res) {
            if (res == true) {
              refreshPage();
            }
          });
        },
      ),
      body: ProductScreenContent(
          basketProduct: basketProduct,
          favoriteProduct: favoriteProduct,
          product: product,
          addAmountBasketProduct: (productID, amount) =>
              addAmountBasketProduct(productID, amount),
          minusAmountBasketProduct: (productID, amount) =>
              minusAmountBasketProduct(productID, amount),
          remuveProductBasket: (productID) => remuveProductBasket(productID),
          addProductBasket: (productID, amount) =>
              addProductBasket(productID, amount),
          addProductFavorite: (productId) => addProductFavorite(productId),
          remuveProductFavorite: (productId) =>
              remuveProductFavorite(productId)),
    );
  }
}
