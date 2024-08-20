import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsocks/domain/models/favorite_product.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/cubit/favoriteCubit/favorite_cubit.dart';
import 'package:shopsocks/presentation/pages/favoriteScreen/favorite_screen.dart';
import 'package:shopsocks/presentation/pages/favoriteScreen/widgets/favorit_content.dart';
import 'package:shopsocks/presentation/pages/productScreen/product_cubit_controller.dart';
import 'package:shopsocks/common/widgets/error_content.dart';
import 'package:shopsocks/common/widgets/loading_content.dart';

class FavoriteCubitControllerScreen extends StatefulWidget {
  final User user;
  const FavoriteCubitControllerScreen({super.key, required this.user});

  @override
  State<FavoriteCubitControllerScreen> createState() =>
      _FavoriteCubitControllerScreenState();
}

class _FavoriteCubitControllerScreenState
    extends State<FavoriteCubitControllerScreen> {
  late FavoriteCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = FavoriteCubit()..initialFavorite(widget.user.idTg);
  }

  @override
  void dispose() {
    super.dispose();
  }

  refReshScreen() {
    cubit.initialFavorite(widget.user.idTg);
  }

  void onTap(Product product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductCubitControllerScreen(
                  product: product,
                  user: widget.user,
                ))).then((res) {
      if (res == true) {
        refReshScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
        bloc: cubit,
        builder: (context, state) {
          return state.when(
            initial: (List<FavoriteProduct> favoriteProducts) => FavoriteScreen(
              onTap: (Product product) => onTap(product),
              favoriteProducts: favoriteProducts,
              user: widget.user,
            ),
            loading: () => LoadingContent(
              routname: '/favorite',
              userId: widget.user.idTg,
              title: 'Загрузка...',
              text:
                  'Мы загружаем ваши избранные товары. Скоро они будут доступны для просмотра.',
            ),
            error: () => ErrorContent(
                routname: '/order',
                userId: widget.user.idTg,
                title: 'Избранные товары не найдены',
                text:
                    'Кажется, у вас пока нет избранных товаров. Добавьте что-то в список избранных, чтобы увидеть их здесь.'),
          );
        });
  }
}
