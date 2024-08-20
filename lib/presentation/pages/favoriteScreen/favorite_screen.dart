import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/domain/models/favorite_product.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/favoriteScreen/widgets/favorit_content.dart';
import 'package:shopsocks/common/widgets/appbar.dart';

class FavoriteScreen extends StatelessWidget {
  final User user;
  final void Function(Product product) onTap;
  final List<FavoriteProduct> favoriteProducts;
  const FavoriteScreen(
      {super.key,
      required this.user,
      required this.onTap,
      required this.favoriteProducts});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child:  Scaffold(
  resizeToAvoidBottomInset: false,            backgroundColor: AppColors.bgAppContent,
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
            body: favoriteProducts.isEmpty
                ? const FavoritEmptyContent()
                : FavoritContent(
                    onTap: (Product product) => onTap(product),
                    favoriteProducts: favoriteProducts,
                    userId: user.idTg,
                  )));
  }
}
