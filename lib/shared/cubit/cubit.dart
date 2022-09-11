import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/models/brands/brands.dart';
import 'package:multikart/models/top_cate/top.dart';
import 'package:multikart/models/trend/trend.dart';
import 'package:multikart/modules/card/cart.dart';
import 'package:multikart/modules/category/cate.dart';
import 'package:multikart/modules/products/products.dart';
import 'package:multikart/modules/profile/profile.dart';
import 'package:multikart/modules/wish/wish.dart';
import 'package:multikart/shared/cubit/states.dart';

class MulikartCubit extends Cubit<MultikartStates> {
  MulikartCubit() : super(InitialMultikart());
  static MulikartCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'HOME',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.category,
      ),
      label: 'CATEGORY',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.production_quantity_limits_sharp,
      ),
      label: 'CART',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_border,
      ),
      label: 'WISHLIST',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
      ),
      label: 'PROFILE',
    ),
  ];
  List<Widget> screens = [
    Products(),
    const Cate(),
    const Cart(),
    const Wish(),
    const Profile(),
  ];
  List<TopCate> topCate = [
    TopCate('Kids', 'images/kids.png',),
    TopCate('Beauty', 'images/beauty.png'),
    TopCate('Footwear', 'images/shoes.png',),
    TopCate('Jewelry', 'images/jewelry.png'),
    TopCate('Women', 'images/women.png'),
    TopCate('Men', 'images/men.png'),
  ];
  List<TrendItem> trendItem = [
    TrendItem('Blue Denim Jacket', 'images/4.jpg'),
    TrendItem('orange SweetShirt', 'images/5.jpg'),
    TrendItem('orange dress', 'images/6.jpg'),
    TrendItem('Green SweetShirt', 'images/7.jpg'),
  ];
  List<Brands> brandItem = [
    Brands('images/b6.png'),
    Brands('images/b2.png'),
    Brands('images/b3.png'),
    Brands('images/b4.png'),
    Brands('images/b5.png'),
    Brands('images/b1.png'),
  ];
  void changeScreen(index) {
    currentIndex = index;
    emit(ChangeScreen());
  }
}
