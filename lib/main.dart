import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/layout/layout.dart';
import 'package:multikart/shared/components/components.dart';
import 'package:multikart/shared/components/constants.dart';
import 'package:multikart/shared/cubit/cubit.dart';
import 'package:multikart/shared/cubit/states.dart';
import 'package:multikart/shared/network/local/cache_helper.dart';
import 'package:multikart/shared/styles/themes.dart';
import 'modules/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId');
  print('Uid = $uId');
  Widget? widget;
  bool? mode = CacheHelper.getData(key: 'mode');
  if (uId != null) {
    widget = const Layout();
  } else {
    widget = LoginScreen();
  }
  runApp(MyApp(
    startWidget: widget,
    appMode: mode,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  final bool? appMode;
  const MyApp({Key? key, this.startWidget, this.appMode}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MulikartCubit()
        ..getUserData()
        ..createDatabase()
        ..changeMode(fromShared: appMode),
      child: BlocConsumer<MulikartCubit, MultikartStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = MulikartCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Multikart',
              theme: lightTheme,
              themeMode: cubit.dark ? ThemeMode.dark : ThemeMode.light,
              darkTheme: darkTheme,
              home: AnimatedSplashScreen(
                splash: logo(),
                duration: 3000,
                nextScreen: startWidget!,
                splashTransition: SplashTransition.scaleTransition,
                backgroundColor: Colors.white,
                //type: AnimatedSplashType.StaticSplashScreen,
              ),
            );
          }),
    );
  }
}
