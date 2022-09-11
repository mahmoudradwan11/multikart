import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/layout/home.dart';
import 'package:multikart/shared/components/constants.dart';
import 'package:multikart/shared/cubit/cubit.dart';
import 'package:multikart/shared/cubit/states.dart';
import 'package:multikart/shared/network/local/cache_helper.dart';
import 'package:multikart/shared/styles/themes.dart';

import 'modules/login/login.dart';
void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId');
  print('Uid = $uId');
  Widget? widget;
  if (uId != null) {
    widget = const Home();
  } else {
    widget = LoginScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}
class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({Key? key,this.startWidget,}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>MulikartCubit()..getUserData(),
        child: BlocConsumer<MulikartCubit,MultikartStates>(
        listener: (context, state) {},
    builder: (context, state)
    {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Multikart',
          theme: lightTheme,
          themeMode: ThemeMode.light,
          darkTheme: darkTheme,
          home:startWidget,
        );
    }
        ),
    );
  }
}