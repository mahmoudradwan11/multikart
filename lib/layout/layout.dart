import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/modules/about_us/about.dart';
import 'package:multikart/modules/help/help.dart';
import 'package:multikart/modules/products/Product.dart';
import 'package:multikart/modules/wish/wish.dart';
import 'package:multikart/shared/components/components.dart';
import 'package:multikart/shared/cubit/cubit.dart';
import 'package:multikart/shared/cubit/states.dart';

import '../modules/card/cart.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);
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
                      onPressed: (){},
                      icon: const Icon(Icons.notification_important_rounded))),
              Container(
                  width: 40,
                  child: IconButton(
                      onPressed: (){
                        navigateTo(context,const Wish());
                      },
                      icon: const Icon(Icons.favorite_border))),
              Container(
                  width: 40,
                  child: IconButton(
                      onPressed: () {
                        navigateTo(context,const CardScreen());
                      }, icon: const Icon(Icons.shopping_cart))),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('${cubit.name}'),
                  accountEmail: Text('${cubit.email}'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage('${cubit.image}'),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 72),
                      child: Text(
                        'Dark',
                        style: TextStyle(fontFamily: 'Jannah', fontSize: 20),
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: cubit.dark,
                      onChanged: (val) {
                        cubit.changeMode();
                      },
                    ),
                  ],
                ),
                ListTile(
                  title: const Text('My Card'),
                  leading: const Icon(Icons.card_giftcard),
                  onTap: () {
                    navigateTo(context, const CardScreen());
                  },
                ),
                ListTile(
                  title: const Text('Products'),
                  leading: const Icon(Icons.production_quantity_limits_sharp),
                  onTap: () {
                    navigateTo(context, const Products());
                  },
                ),
                ListTile(
                  title: const Text('About Us'),
                  leading: const Icon(Icons.interpreter_mode_rounded),
                  onTap: () {
                    navigateTo(context, const AboutUs());
                  },
                ),
                ListTile(
                  title: const Text('Help Center'),
                  leading: const Icon(Icons.help),
                  onTap: () {
                    navigateTo(context, const Help());
                  },
                ),
              ],
            ),
          ),
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
