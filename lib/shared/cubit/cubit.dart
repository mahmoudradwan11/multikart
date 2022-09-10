import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/modules/card/cart.dart';
import 'package:multikart/modules/category/cate.dart';
import 'package:multikart/modules/products/products.dart';
import 'package:multikart/modules/profile/profile.dart';
import 'package:multikart/modules/wish/wish.dart';
import 'package:multikart/shared/cubit/states.dart';

class MulikartCubit extends Cubit<MultikartStates>
{
  MulikartCubit():super(InitialMultikart());
  static MulikartCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0 ;
  List<BottomNavigationBarItem>items =const[
    BottomNavigationBarItem(
      icon:Icon(
        Icons.home,
      ),
      label:'HOME',
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.category,
      ),
      label:'CATEGORY',
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.production_quantity_limits_sharp,
      ),
      label:'CART',
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.favorite_border,
      ),
      label:'WISHLIST',
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.person,
      ),
      label:'PROFILE',
    ),
  ];
  List<Widget>screens =[
     Products(),
     const Cate(),
     const Cart(),
     const Wish(),
     const Profile(),
  ];
  void changeScreen(index)
  {
    currentIndex = index;
    emit(ChangeScreen());
  }

}
