import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart';

import 'package:shopsocks/presentation/app_navigator.dart';
import 'package:shopsocks/presentation/cubit/userAuthCubit/user_auth_cubit.dart';
import 'package:shopsocks/presentation/pages/errorPage/error_page.dart';
import 'package:shopsocks/presentation/pages/splashScreen/splash_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late UserAuthCubit cubit;
  final WebAppInitData webAppInitData = tg.initDataUnsafe;

  @override
  void initState() {
    super.initState();
    cubit = UserAuthCubit()..intialUser(webAppInitData.user?.id ?? 982475812);
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: "OptomNoski",
          debugShowCheckedModeBanner: false,
          shortcuts: {
            LogicalKeySet(LogicalKeyboardKey.space): ActivateIntent()
          },
          home: Scaffold(
              resizeToAvoidBottomInset: false,
              body: BlocBuilder<UserAuthCubit, UserAuthState>(
                  bloc: cubit,
                  builder: (context, state) {
                    (state);
                    return state.when(
                      initial: (user) => AppHome(user: user),
                      loading: () => SplashScreen(),
                      error: () => ErrorScreen(),
                    );
                  })));
    });
  }
}
