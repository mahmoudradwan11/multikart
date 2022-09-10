import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/layout/home.dart';
import 'package:multikart/shared/cubit/cubit.dart';
import 'package:multikart/shared/cubit/states.dart';
import 'package:multikart/shared/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>MulikartCubit(),
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
          home:const Home(),
        );
    }
        ),
    );
  }
}