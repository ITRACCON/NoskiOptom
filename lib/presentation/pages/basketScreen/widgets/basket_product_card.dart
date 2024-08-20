import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/productScreen/product_cubit_controller.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class BasketProductCard extends StatelessWidget {
  final BasketProduct basketProduct;

  final void Function(String productID, int amount) addAmountBasketProduct;
  final void Function(String productID, int amount) minusAmountBasketProduct;
  final void Function(String productID) remuveProductBasket;
  final User user;
  const BasketProductCard(
      {super.key,
      required this.basketProduct,
      required this.addAmountBasketProduct,
      required this.minusAmountBasketProduct,
      required this.remuveProductBasket,
      required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductCubitControllerScreen(
                            product: basketProduct.product,
                            user: user,
                          )));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 15.h,
                width: 22.w,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  errorWidget: (context, a, b) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AppImages.noPhoto,
                        height: 15.h,
                        width: 22.w,
                        fit: BoxFit.cover,
                      )),
                  placeholder: (context, url) => Container(
                    height: 15.h,
                    width: 22.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.black.withOpacity(0.2)),
                    child: SizedBox(
                        width: 5.w, child: const CircularProgressIndicator()),
                  ),
                  imageUrl: basketProduct.product!.photo,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Container(
              constraints: BoxConstraints(maxHeight: 15.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 58.w,
                              child: AppText(
                                  text: basketProduct.product!.title,
                                  textAlign: TextAlign.left,
                                  textStyle: TextStyle(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            AppText(
                                text:
                                    'АРТИКУЛ: ${basketProduct.product!.article}',
                                textAlign: TextAlign.left,
                                textStyle: TextStyle(
                                    fontSize: 8.sp, color: Colors.grey)),
                          ])),
                  Container(
                      alignment: Alignment.bottomCenter,
                      width: 58.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {
                                    if (basketProduct.amount <=
                                        basketProduct.product!.minamount) {
                                      remuveProductBasket(
                                          basketProduct.product!.article);
                                    } else {
                                      minusAmountBasketProduct(
                                          basketProduct.product!.article,
                                          basketProduct.product!.minamount);
                                    }
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5)),
                                          color: AppColors.greenTitle),
                                      child: Icon(
                                        Icons.remove,
                                        size: 14.sp,
                                        color: AppColors.white,
                                      ))),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  color: AppColors.greenText.withOpacity(0.3),
                                  child: AppText(
                                      text: '${basketProduct.amount}',
                                      textAlign: TextAlign.center,
                                      textStyle: TextStyle(
                                          fontSize: 10.sp,
                                          color: AppColors.black))),
                              InkWell(
                                  onTap: () {
                                    addAmountBasketProduct(
                                        basketProduct.product!.article,
                                        basketProduct.product!.minamount);
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5)),
                                          color: AppColors.greenTitle),
                                      child: Icon(
                                        Icons.add,
                                        size: 14.sp,
                                        color: AppColors.white,
                                      ))),
                            ],
                          ),
                          AppText(
                              text:
                                  '${(basketProduct.product!.price * basketProduct.amount).round()} ₽',
                              textAlign: TextAlign.left,
                              textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.greenTitle)),
                        ],
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
