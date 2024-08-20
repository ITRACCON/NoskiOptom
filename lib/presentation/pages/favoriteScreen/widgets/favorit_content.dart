import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/favorite_product.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/presentation/pages/catalogScreen/widgets/product_card.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class FavoritContent extends StatelessWidget {
  final void Function(Product product) onTap;
  final List<FavoriteProduct> favoriteProducts;
  final int userId;
  const FavoritContent(
      {super.key,
      required this.favoriteProducts,
      required this.userId,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
        height: 95.h,
        child: Column(children: [
          AppText(
              text: "Избранное",
              textStyle:
                  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
              child: MasonryGridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(
                  searchText: 'NO',
                  onTap: (Product product) => onTap(product),
                  product: favoriteProducts[index].product,
                  userId: userId,
                  key: ValueKey(favoriteProducts[index].product!.id));
            },
          ))
        ]));
  }
}

class FavoritEmptyContent extends StatelessWidget {
  const FavoritEmptyContent({super.key});

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
                  AppImages.favoritEmpty,
                  width: 75.w,
                ),
                SizedBox(height: 2.h),
                AppText(
                    text: "Список избранных товаров пуст",
                    textStyle: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 2.h),
                AppText(
                    text:
                        "Добавьте товары в избранное, чтобы не потерять понравившиеся товар.",
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
