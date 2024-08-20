import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/catalogScreen/widgets/catalog_content.dart';
import 'package:shopsocks/presentation/cubit/appBarCubit/appbar_cubit.dart';
import 'package:shopsocks/common/widgets/appbar.dart';
import 'package:shopsocks/common/widgets/sidebar.dart';

class CatalogScreen extends StatelessWidget {
  final List<Product> products;
  final String category;
  final User user;
  final int pages;
  final void Function(int minPrice, int maxPrice, String valueSort, int page,
      String typePage, String searchReq) initCatalog;
  final void Function(Product product) onTap;
  final String typePage;
  final AppBarCubit appBarCubit;
  const CatalogScreen(
      {super.key,
      required this.category,
      required this.user,
      required this.products,
      required this.pages,
      required this.initCatalog,
      required this.onTap,
      required this.typePage,
      required this.appBarCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: false,
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.bgAppContent,
        appBar: CustomAppBar(
          userId: user.idTg,
          onTapFavorite: () {
            Navigator.pushNamed(context, '/favorite');
          },
          onTapBasket: () {
            Navigator.pushNamed(context, '/basket');
          },
        ),
        drawer: const Sidebar(routName: '/catalog'),
        body: CatalogContent(
          typePage: typePage,
          pages: pages,
          initCatalog: (int minPrice, int maxPrice, String sort, int page,
                  String typePage, String searchReq) =>
              initCatalog(minPrice, maxPrice, sort, page, typePage, searchReq),
          onTap: (Product product) => onTap(product),
          products: products,
          category: category,
          user: user,
        ));
  }
}
