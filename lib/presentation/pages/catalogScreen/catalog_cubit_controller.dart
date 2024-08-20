import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsocks/utils/constants/categorys.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/catalogScreen/catalog_screen.dart';
import 'package:shopsocks/presentation/cubit/appBarCubit/appbar_cubit.dart';
import 'package:shopsocks/presentation/cubit/productsCubit/products_cubit.dart';
import 'package:shopsocks/presentation/pages/productScreen/product_cubit_controller.dart';
import 'package:shopsocks/common/widgets/error_content.dart';
import 'package:shopsocks/common/widgets/loading_content.dart';

class CatalogCubitControllerScreen extends StatefulWidget {
  final String? category;
  final User user;
  const CatalogCubitControllerScreen(
      {super.key, this.category, required this.user});

  @override
  State<CatalogCubitControllerScreen> createState() =>
      _CatalogCubitControllerScreenState();
}

class _CatalogCubitControllerScreenState
    extends State<CatalogCubitControllerScreen> {
  late ProductsCubit cubit;
  late AppBarCubit appBarCubit;
  @override
  void initState() {
    super.initState();
    cubit = ProductsCubit()..initialProducts(widget.category ?? '');
    appBarCubit = AppBarCubit()..initialAppBar(widget.user.idTg);
  }

  @override
  void dispose() {
    super.dispose();
  }

  initCatalog(int minPrice, int maxPrice, String category, String sort,
      int page, String typePage, String searchReq) {
    cubit.initCatalog(
        minPrice, maxPrice, category, sort, page, typePage, searchReq);
  }

  void onTap(Product product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductCubitControllerScreen(
                  product: product,
                  user: widget.user,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
        bloc: cubit,
        builder: (context, state) {
          return state.when(
            initial: (List<Product> products, int pages, String typePage) =>
                CatalogScreen(
              appBarCubit: appBarCubit,
              typePage: typePage,
              pages: pages,
              initCatalog: (int minPrice, int maxPrice, String sort, int page,
                      String typePage, String searchReq) =>
                  initCatalog(minPrice, maxPrice, widget.category ?? '', sort,
                      page, typePage, searchReq),
              onTap: (Product product) => onTap(product),
              products: products,
              category: AppInfo.categorys[widget.category] ?? '',
              user: widget.user,
            ),
            loading: () => LoadingContent(
              routname: '/catalog',
              userId: widget.user.idTg,
              title: 'Загрузка...',
              text:
                  'Пожалуйста, подождите, пока мы загружаем каталог товаров для вас.',
            ),
            error: () => ErrorContent(
                routname: '/order',
                userId: widget.user.idTg,
                title: 'Ошибка загрузки',
                text: 'Что-то пошло не так. Пожалуйста, попробуйте снова.'),
          );
        });
  }
}
