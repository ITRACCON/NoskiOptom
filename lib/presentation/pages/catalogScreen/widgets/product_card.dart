import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  final void Function(Product product) onTap;
  final Product? product;
  final int userId;
  final String searchText;
  const ProductCard(
      {super.key,
      required this.product,
      required this.userId,
      required this.onTap,
      required this.searchText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onTap(product!),
        child: Container(
          width: 40.w,
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.borderLightGrey),
              color: AppColors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25.h,
                width: 37.w,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  errorWidget: (context, a, b) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AppImages.noPhoto,
                        height: 25.h,
                        width: 37.w,
                        fit: BoxFit.cover,
                      )),
                  placeholder: (context, url) => Container(
                    height: 25.h,
                    width: 37.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.black.withOpacity(0.2)),
                    child: SizedBox(
                      child: Center(
                          child: CircularProgressIndicator(
                        color: AppColors.greenTitle,
                      )),
                      height: 10.w,
                      width: 10.w,
                    ),
                  ),
                  imageUrl: product!.photo,
                ),
              ),
              SizedBox(height: 0.5.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  searchText != 'NO'
                      ? AppHighlightText(
                          text: product!.title,
                          highlightText: searchText,
                          textStyle: TextStyle(fontSize: 11.sp),
                          highlightTextStyle: TextStyle(
                              fontSize: 11.sp,
                              backgroundColor: AppColors.greenTitle,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        )
                      : AppText(
                          text: product!.title,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          textStyle: TextStyle(fontSize: 11.sp)),
                  AppText(
                      text: 'Артикул: ${product!.article}',
                      textAlign: TextAlign.left,
                      textStyle:
                          TextStyle(fontSize: 8.sp, color: AppColors.greyText)),
                  SizedBox(height: 0.8.h),
                  AppText(
                      text: '${product!.price} ₽/пара',
                      textStyle: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
        ));
  }
}
