import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/shared/cubit/cubit.dart';
import 'package:multikart/shared/cubit/states.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MulikartCubit, MultikartStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MulikartCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            //leading: const Icon(Icons.menu),
            title: Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Container(
                  width: 130,
                  height: 100,
                  child: const Image(
                    image: AssetImage('images/title.png'),
                    // width: 20,
                    // height: 20,
                    fit: BoxFit.contain,
                  ),
                ),
               // const Text('ultikart'),
              ],
            ),
            actions: [
              Container(
                width: 40,
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search)),
              ),
              Container(
                  width: 40,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notification_important_rounded))),
              Container(
                  width: 40,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border))),
              Container(
                  width: 40,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.shopping_cart))),
            ],
          ),
          drawer: const Drawer(),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeScreen(index);
            },
          ),
        );

      },
    );
  }
}
