import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/cubit/appBarCubit/appbar_cubit.dart';
import 'package:shopsocks/presentation/cubit/basketCubit/basket_cubit.dart';

import 'basket_screen.dart';

class BasketCubitControllerScreen extends StatefulWidget {
  final User user;
  const BasketCubitControllerScreen({super.key, required this.user});

  @override
  State<BasketCubitControllerScreen> createState() =>
      _BasketCubitControllerScreenState();
}

class _BasketCubitControllerScreenState
    extends State<BasketCubitControllerScreen> {
  late BasketCubit cubit;
  late AppBarCubit appBarCubit;

  @override
  void initState() {
    super.initState();
    cubit = BasketCubit()..initialBasket(widget.user.idTg);
    appBarCubit = AppBarCubit()..initialAppBar(widget.user.idTg);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addAmountBasketProduct(String productID, int amount) {
    cubit.addAmountBasketProduct(widget.user.idTg, productID, amount, 'basket');
  }

  void minusAmountBasketProduct(String productID, int amount) {
    cubit.minusAmountBasketProduct(
        widget.user.idTg, productID, amount, 'basket');
  }

  void remuveProductBasket(String productID) {
    cubit.remuveProductBasket(widget.user.idTg, productID, 'basket');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketCubit, BasketState>(
        bloc: cubit,
        builder: (context, state) {
          return state.when(
              initial: (List<BasketProduct> basketProducts) => BasketScreen(
                    user: widget.user,
                    appBarCubit: appBarCubit,
                    basket: basketProducts,
                    addAmountBasketProduct: (productID, amount) =>
                        addAmountBasketProduct(productID, amount),
                    minusAmountBasketProduct: (productID, amount) =>
                        minusAmountBasketProduct(productID, amount),
                    remuveProductBasket: (productID) =>
                        remuveProductBasket(productID),
                  ),
              initialProduct: (BasketProduct basketProducts) => Container(),
              loading: () => Container(),
              error: () => Container());
        });
  }
}
