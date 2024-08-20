import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopsocks/data/cfg.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/aboutScreen/about_screen.dart';
import 'package:shopsocks/presentation/pages/adminPanel/home_screen.dart';
import 'package:shopsocks/presentation/pages/basketScreen/basket_cubit_controller.dart';
import 'package:shopsocks/presentation/pages/catalogScreen/catalog_cubit_controller.dart';
import 'package:shopsocks/presentation/pages/contactScreen/contact_Screen.dart';
import 'package:shopsocks/presentation/pages/deliverlyScreen/deliverly_screen.dart';
import 'package:shopsocks/presentation/pages/favoriteScreen/favorite_cubit_screen.dart';
import 'package:shopsocks/presentation/pages/fulfimentScreen/fulfiment_screen.dart';
import 'package:shopsocks/presentation/pages/homeScreen/home_screen.dart';
import 'package:shopsocks/presentation/pages/paymentsScreen/payments_screen.dart';
import 'package:shopsocks/presentation/pages/productionscreen/production_screen.dart';

class AppHome extends StatelessWidget {
  final User user;
  const AppHome({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        shortcuts: {LogicalKeySet(LogicalKeyboardKey.space): ActivateIntent()},
        initialRoute:
            user.idTg.toString() == AppConfing.idAdmin ? '/admin' : '/',
        debugShowCheckedModeBanner: false,
        color: AppColors.greenTitle,
        theme: ThemeData(
          primaryColor: AppColors.greenTitle,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors.greenTitle,
          ),
        ),
        routes: {
          '/': (BuildContext context) => HomeScreen(user: user),
          '/catalog': (BuildContext context) =>
              CatalogCubitControllerScreen(user: user),
          '/deliverly': (BuildContext context) => DeliverlyScreen(user: user),
          '/oplata': (BuildContext context) => PaymentsScreen(user: user),
          '/about': (BuildContext context) => AboutScreen(user: user),
          '/fulfilment': (BuildContext context) => FulfimentScreen(user: user),
          '/production': (BuildContext context) => ProducionScreen(user: user),
          '/contact': (BuildContext context) => ContactScreen(user: user),
          '/basket': (BuildContext context) =>
              BasketCubitControllerScreen(user: user),
          '/favorite': (BuildContext context) =>
              FavoriteCubitControllerScreen(user: user),
          '/admin': (BuildContext context) => AdminHome()
        },
        onGenerateRoute: (routeSettings) {
          var path = routeSettings.name!.split('/');
          if (path[1] == "catalog") {
            return MaterialPageRoute(
              builder: (context) => CatalogCubitControllerScreen(
                category: path[2],
                user: user,
              ),
              settings: routeSettings,
            );
          }
        });
  }
}
