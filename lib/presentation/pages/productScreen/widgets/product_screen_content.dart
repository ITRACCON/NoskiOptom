import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/favorite_product.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:shopsocks/common/widgets/image_modal.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductScreenContent extends StatelessWidget {
  final Product? product;
  final BasketProduct basketProduct;
  final FavoriteProduct favoriteProduct;
  final void Function(String productID, int amount) addProductBasket;
  final void Function(String productID, int amount) addAmountBasketProduct;
  final void Function(String productID, int amount) minusAmountBasketProduct;
  final void Function(String productID) remuveProductBasket;
  final void Function(String productID) addProductFavorite;
  final void Function(String productID) remuveProductFavorite;
  const ProductScreenContent(
      {super.key,
      required this.addAmountBasketProduct,
      required this.minusAmountBasketProduct,
      required this.remuveProductBasket,
      required this.product,
      required this.addProductBasket,
      required this.basketProduct,
      required this.favoriteProduct,
      required this.addProductFavorite,
      required this.remuveProductFavorite});

  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoriteProduct.product != null ? true : false;
    return ListView(children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 1.h),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        InkWell(
                            onTap: () async {
                              await showDialog(
                                  context: context,
                                  builder: (_) => ImageModal(
                                        photo: product!.photo,
                                      ));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                 width: 80.h,
                                        height: 50.h,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  errorWidget: (context, a, b) => ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        AppImages.noPhoto,
                                        width: 80.h,
                                        height: 50.h,
                                        fit: BoxFit.cover,
                                      )),
                                  placeholder: (context, url) => Container(
                                    height: 25.h,
                                    width: 38.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Colors.black.withOpacity(0.4)),
                                    child: const CircularProgressIndicator(),
                                  ),
                                  imageUrl: product!.photo,
                                ),
                              ),
                            )),
                        InkWell(
                          onTap: () {
                            isFavorite
                                ? remuveProductFavorite(product!.article)
                                : addProductFavorite(product!.article);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_outlined,
                              color: isFavorite ? AppColors.red : Colors.black,
                              size: 26.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        children: [
                          Expanded(
                              child: AppText(
                                  textAlign: TextAlign.left,
                                  text: product!.title,
                                  textStyle: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black))),
                          const SizedBox(
                            width: 10,
                          ),
                          AppText(
                              textAlign: TextAlign.left,
                              text: '${product!.price} ₽',
                              textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.greenTitle)),
                        ],
                      ),
                    )
                  ])),
              SizedBox(
                height: 2.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  basketProduct.amount != 0
                      ? Container(
                          alignment: Alignment.center,
                          width: 80.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                                  bottomLeft:
                                                      Radius.circular(5)),
                                              color: AppColors.greenTitle),
                                          child: Icon(
                                            Icons.remove,
                                            size: 18.sp,
                                            color: AppColors.white,
                                          ))),
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 6),
                                      color:
                                          AppColors.greenText.withOpacity(0.3),
                                      child: AppText(
                                          text: '${basketProduct.amount}',
                                          textAlign: TextAlign.center,
                                          textStyle: TextStyle(
                                              fontSize: 12.sp,
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
                                                  bottomRight:
                                                      Radius.circular(5)),
                                              color: AppColors.greenTitle),
                                          child: Icon(
                                            Icons.add,
                                            size: 18.sp,
                                            color: AppColors.white,
                                          ))),
                                ],
                              ),
                              AppText(
                                  text:
                                      '${(product!.price * basketProduct.amount).round()} ₽',
                                  textAlign: TextAlign.left,
                                  textStyle: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greenTitle)),
                            ],
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            addProductBasket(
                                product!.article, product!.minamount);
                          },
                          child: Container(
                            width: 90.w,
                            padding: const EdgeInsets.symmetric(
                                vertical: 7, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.greenTitle),
                            child: AppText(
                                text: 'Добавить в корзину',
                                textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white)),
                          )),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: 90.w,
                    padding:
                        EdgeInsets.symmetric(vertical: 2.w, horizontal: 1.h),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                            textAlign: TextAlign.left,
                            text: 'АРТИКУЛ: ${product!.article}',
                            textStyle:
                                TextStyle(fontSize: 10.sp, color: Colors.grey)),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                AppText(
                                    textAlign: TextAlign.left,
                                    text: 'Размер',
                                    textStyle: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 7),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: AppColors.black, width: 1.sp)),
                                  child: AppText(
                                      textAlign: TextAlign.left,
                                      text: product!.size,
                                      textStyle: TextStyle(
                                        fontSize: 10.sp,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Column(
                              children: [
                                AppText(
                                    textAlign: TextAlign.left,
                                    text: 'В мешке',
                                    textStyle: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 7),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppColors.black,
                                            width: 1.sp)),
                                    child: AppText(
                                        textAlign: TextAlign.left,
                                        text: '${product!.minamount} пар',
                                        textStyle: TextStyle(
                                          fontSize: 10.sp,
                                        ))),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        AppText(
                            textAlign: TextAlign.left,
                            text: product!.description,
                            textStyle: TextStyle(
                              fontSize: 10.sp,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                      width: 90.w,
                      padding:
                          EdgeInsets.symmetric(vertical: 2.w, horizontal: 1.h),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                                text: "Есть вопросы по товару? Напишите! ",
                                textStyle: TextStyle(fontSize: 12.sp)),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse('https://t.me/geva13'));
                                  },
                                  child: Image.asset(
                                    AppImages.tgLogo,
                                    width: 15.w,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        'https://api.whatsapp.com/send/?phone=79777002728&text=Здравствуйте%2C+вопрос+по+носкам+артикул:+${product!.article}+навзание:${product!.title}&type=phone_number&app_absent=0'));
                                  },
                                  child: Image.asset(
                                    AppImages.waLogo,
                                    width: 15.w,
                                  ),
                                )
                              ],
                            )
                          ]))
                ],
              )
            ],
          ))
    ]);
  }
}
