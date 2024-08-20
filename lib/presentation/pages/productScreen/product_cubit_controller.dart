import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/favorite_product.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/cubit/productCubit/product_cubit.dart';
import 'package:shopsocks/presentation/pages/productScreen/product_screen.dart';
import 'package:shopsocks/common/widgets/error_content.dart';
import 'package:shopsocks/common/widgets/loading_content.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;

class ProductCubitControllerScreen extends StatefulWidget {
  final Product? product;
  final User user;
  const ProductCubitControllerScreen(
      {super.key, required this.product, required this.user});

  @override
  State<ProductCubitControllerScreen> createState() =>
      _ProductCubitControllerScreenState();
}

class _ProductCubitControllerScreenState
    extends State<ProductCubitControllerScreen> with RouteAware {
  final tg.WebAppInitData webAppInitData = tg.initDataUnsafe;
  late ProductCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProductCubit()
      ..getProduct(widget.user.idTg, widget.product!.article);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void refreshPage() {
    setState(() {});
    cubit = ProductCubit()
      ..getProduct(widget.user.idTg, widget.product!.article);
  }

  void addProductBasket(String productID, int amount) {
    cubit.addProductBasket(
        widget.user.idTg,
        productID,
        amount,
        webAppInitData.user?.username ?? 'none',
        '${webAppInitData.user?.first_name ?? 'none'} ${webAppInitData.user?.last_name ?? 'none'}');
  }

  void addAmountBasketProduct(String productID, int amount) {
    cubit.addAmountBasketProduct(widget.user.idTg, productID, amount);
  }

  void minusAmountBasketProduct(String productID, int amount) {
    cubit.minusAmountBasketProduct(widget.user.idTg, productID, amount);
  }

  void remuveProductBasket(String productID) {
    cubit.remuveProductBasket(widget.user.idTg, productID);
  }

  void addProductFavorite(String productID) {
    cubit.addProductFavorite(widget.user.idTg, productID);
  }

  void remuveProductFavorite(String productID) {
    cubit.remuveProductFavorite(widget.user.idTg, productID);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
        bloc: cubit,
        builder: (context, state) {
          return state.when(
            initialProduct: (BasketProduct basketProduct,
                    FavoriteProduct favoriteProduct) =>
                ProductScreen(
              basketProduct: basketProduct,
              favoriteProduct: favoriteProduct,
              product: widget.product,
              addAmountBasketProduct: (productID, amount) =>
                  addAmountBasketProduct(productID, amount),
              minusAmountBasketProduct: (productID, amount) =>
                  minusAmountBasketProduct(productID, amount),
              remuveProductBasket: (productID) =>
                  remuveProductBasket(productID),
              addProductBasket: (productID, amount) =>
                  addProductBasket(productID, amount),
              addProductFavorite: (productId) => addProductFavorite(productId),
              remuveProductFavorite: (productId) =>
                  remuveProductFavorite(productId),
              user: widget.user,
              refreshPage: refreshPage,
            ),
            loading: () => LoadingContent(
              routname: '/catalog',
              userId: widget.user.idTg,
              title: 'Загрузка...',
              text:
                  'Мы загружаем информацию о товаре. Это займет всего лишь несколько секунд.',
            ),
            error: () => ErrorContent(
                routname: '/catalog',
                userId: widget.user.idTg,
                title: 'Товар недоступен',
                text:
                    'Извините, этот товар временно недоступен. Пожалуйста, попробуйте посмотреть другие товары.'),
          );
        });
  }
}
