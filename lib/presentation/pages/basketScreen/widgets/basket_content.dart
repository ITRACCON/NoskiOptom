import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/basketScreen/widgets/basket_product_card.dart';
import 'package:shopsocks/presentation/pages/placingOrderScreen/placing_cubit_controller.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class BasketContent extends StatelessWidget {
  final List<BasketProduct> basket;
  final void Function(String productID, int amount) addAmountBasketProduct;
  final void Function(String productID, int amount) minusAmountBasketProduct;
  final void Function(String productID) remuveProductBasket;
  final User user;
  const BasketContent(
      {super.key,
      required this.basket,
      required this.addAmountBasketProduct,
      required this.minusAmountBasketProduct,
      required this.remuveProductBasket,
      required this.user});

  getAllMoneyBasket() {
    double money = 0;
    for (int id = 0; id < basket.length; id++) {
      money += basket[id].amount * basket[id].product!.price;
    }
    return money;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 3.h),
        height: 95.h,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: 70.h,
                  child: ListView(children: [
                    Column(
                        children: basket.map((BasketProduct basketProduct) {
                      return BasketProductCard(
                          user: user,
                          basketProduct: basketProduct,
                          addAmountBasketProduct: (productID, amount) =>
                              addAmountBasketProduct(productID, amount),
                          minusAmountBasketProduct: (productID, amount) =>
                              minusAmountBasketProduct(productID, amount),
                          remuveProductBasket: (productID) =>
                              remuveProductBasket(productID),
                          key: ValueKey(basketProduct.product!.id));
                    }).toList())
                  ])),
              Container(
                  width: 100.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: SizedBox(
                    width: 90.w,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                                text: "Итого:",
                                textStyle: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold)),
                            AppText(
                                text: "${getAllMoneyBasket().round().toString()} ₽",
                                textStyle: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.greenTitle)),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                            onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PlacingOrderCubitControllerScreen(
                                            basketProducts: basket,
                                            user: user,
                                          )),
                                ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 10),
                              width: 90.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.greenTitle),
                              child: AppText(
                                  text: 'Оформить заказ',
                                  textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white)),
                            ))
                      ],
                    ),
                  ))
            ]));
  }
}

class BasketEmptyContent extends StatelessWidget {
  const BasketEmptyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        height: 85.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  AppImages.clearBasket,
                  width: 75.w,
                ),
                SizedBox(height: 2.h),
                AppText(
                    text: "Ваша корзина пуста",
                    textStyle: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 2.h),
                AppText(
                    text:
                        "Добавьте товары в корзину, чтобы начать покупки. Ищите нужные товары в нашем каталоге.",
                    textStyle: TextStyle(fontSize: 14.sp)),
              ],
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.greenTitle),
                  child: AppText(
                      text: 'Перейти к товарам',
                      textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white)),
                )),
          ],
        ),
      )
    ]);
  }
}
