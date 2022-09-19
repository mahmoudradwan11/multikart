import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/models/brands/brands.dart';
import 'package:multikart/models/featured/featured.dart';
import 'package:multikart/models/picks/picks.dart';
import 'package:multikart/models/product_model/product_model.dart';
import 'package:multikart/models/rated/rated.dart';
import 'package:multikart/models/top_cate/top.dart';
import 'package:multikart/models/trend/trend.dart';
import 'package:multikart/models/user/user.dart';
import 'package:multikart/modules/category/cate.dart';
import 'package:multikart/modules/home/home.dart';
import 'package:multikart/modules/login/login.dart';
import 'package:multikart/modules/profile/profile.dart';
import 'package:multikart/modules/wish/wish.dart';
import 'package:multikart/shared/components/components.dart';
import 'package:multikart/shared/components/constants.dart';
import 'package:multikart/shared/cubit/states.dart';
import 'package:multikart/shared/network/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';

class MulikartCubit extends Cubit<MultikartStates> {
  MulikartCubit() : super(InitialMultikart());
  static MulikartCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  Database? database;
  UserData? userModel;
  bool dark = true;
  String? name;
  String? email;
  String? image;
  String? selectedSize = 'S';
  int? selectedQuantity = 1;
  List<Map> wish = [];
  List<Map> card = [];
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
    Home(),
    const Cate(),
    const Wish(),
    Profile(),
  ];
  List<ProductModel> products = [
    ProductModel('Pink-Shirt', 'Amazon', 'images/1.jpg', 100, 130),
    ProductModel('Jacket', 'Noon', 'images/2.jpg', 230, 290),
    ProductModel('Orange hat ', 'H&M', 'images/3.jpg', 50, 75),
    ProductModel('Pullover', 'American Eagle', 'images/4.jpg', 290, 350),
    ProductModel('Sweet-Shirt', 'We walk', 'images/5.jpg', 200, 240),
    ProductModel('Dress', 'My sword', 'images/6.jpg', 150, 190),
    ProductModel('Sweet-Shirt', 'Max Fashion', 'images/7.jpg', 210, 250),
    ProductModel('Kids Collection', 'Nike', 'images/8.jpg', 420, 480),
    ProductModel('Pocket', 'Shi In', 'images/9.jpg', 120, 165),
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
    TrendItem('Pocket','images/9.jpg'),
    TrendItem('Kids Collection','images/8.jpg'),
    TrendItem('Sweet-Shirt','images/7.jpg'),
    TrendItem('Dress', 'images/6.jpg'),
  ];
  List<RatedItem> ratedItem = [
    RatedItem('Sweet-Shirt', 'images/5.jpg'),
    RatedItem('Pullover', 'images/4.jpg'),
    RatedItem('Orange hat ', 'images/3.jpg'),
    RatedItem('Jacket', 'images/2.jpg'),
  ];
  List<FeaturedItem> featuredItem = [
    FeaturedItem('Pink-Shirt', 'images/1.jpg'),
    FeaturedItem('Sweet-Shirt', 'images/7.jpg'),
    FeaturedItem('Dress', 'images/6.jpg'),
    FeaturedItem('Sweet-Shirt', 'images/5.jpg'),
  ];
  List<PickItem> pickItem = [
    PickItem('Sweet-Shirt', 'images/5.jpg'),
    PickItem('Dress', 'images/6.jpg'),
    PickItem('Sweet-Shirt', 'images/7.jpg'),
    PickItem('Pullover', 'images/4.jpg'),
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

  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      dark = fromShared;
      emit(ChangeAppMode());
    } else {
      dark = !dark;
      CacheHelper.putBoolData(key: 'mode', value: dark).then((value) {
        emit(ChangeAppMode());
      });
    }
  }

  void selectSize(size) {
    selectedSize = size;
    emit(ChangeSize());
  }

  void selectQuantity(quantity) {
    selectedQuantity = quantity;
    emit(ChangeQuantity());
  }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? image,
  }) {
    emit(UserUpdateLoading());
    UserData model = UserData(
      name: name,
      phone: phone,
      bio: bio,
      email: userModel!.email,
      image: image ?? userModel!.image,
      cover: cover ?? userModel!.cover,
      uid: userModel!.uid,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel!.uid)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(UserUpdateError());
    });
  }

  void getUserData() {
    FirebaseFirestore.instance.collection('Users').doc(uId).get().then((value) {
      print(value.data());
      userModel = UserData.fromJson(value.data()!);
      name = userModel!.name;
      image = userModel!.image;
      email = userModel!.email;
      emit(GetUserSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetUserErrorState(error.toString()));
    });
  }

  void signOut(context) {
    CacheHelper.removeData(key: 'uId').then((value) {
      if (value) {
        navigateAndFinish(context, LoginScreen());
      }
    });
  }

  void createDatabase() {
    openDatabase('Kart.db', version: 2, onCreate: (database, version) {
      print('DataBase Created');
      database
          .execute(
              'create table Wish(id INTEGER PRIMARY KEY,name TEXT , brand TEXT , price INT,image TEXT,oldPrice INT)')
          .then((value) {
        print('Table 1 Created');
      }).catchError((error) {
        print('Error occur : $error');
      });
      database
          .execute(
              'create table Card(id INTEGER PRIMARY KEY,name TEXT , brand TEXT,image TEXT,price INT,oldPrice INT, qty INT ,size TEXT)')
          .then((value) {
        print('Table 2 Created');
      }).catchError((error) {
        print('Error occur : $error');
      });
    }, onOpen: (database) {
      getWish(database);
      getCard(database);
      print('Database opened');
    }).then((value) {
      database = value;
      emit(CreateDataBaseState());
    }).catchError((error) {
      emit(ErrorCreateDataBaseState());
    });
  }

  Future<void> insertWish({
    required String name,
    required String brand,
    required int price,
    required String image,
    required int oldPrice,
  }) async {
    database!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO Wish(name,brand,price,image,oldPrice) VALUES("$name","$brand","$price","$image","$oldPrice")')
          .then((value) {
        print('$value Inserted Successfully');
        emit(InsertWishState());
        getWish(database);
        //print()
      }).catchError((error) {
        print('Error occur : $error');
        emit(ErrorInsertWishState());
      });
    });
  }

  void getWish(database) {
    wish = [];
    database!.rawQuery('select * from Wish').then((value) {
      value.forEach((element) {
        wish.add(element);
      });
      print(wish);
      emit(GetWishState());
    }).catchError((error) {
      print('Error occur no data');
      emit(ErrorGetWishState());
    });
  }

  void deleteWish({required int id}) async {
    await database!
        .rawDelete('DELETE FROM Wish WHERE id= ?', [id]).then((value) {
      getWish(database);
      emit(DeleteWishState());
    });
  }

  Future<void> insertCard({
    required String name,
    required String brand,
    required String image,
    required String size,
    required int price,
    required int qty,
    required int oldPrice,
  }) async {
    database!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO Card(name,brand,image,price,oldPrice,qty,size) VALUES("$name","$brand","$image","$price","$oldPrice","$qty","$size")')
          .then((value) {
        print('$value Inserted Successfully');
        emit(InsertCartState());
        getCard(database);
        //print()
      }).catchError((error) {
        print('Error occur : $error');
        emit(ErrorInsertCardState());
      });
    });
  }

  void getCard(database) {
    card = [];
    database!.rawQuery('select * from Card').then((value) {
      value.forEach((element) {
        card.add(element);
      });
      print(card);
      emit(GetCardState());
    }).catchError((error) {
      print('Error occur no data');
      emit(ErrorGetCardState());
    });
  }
  void deleteCard({required int id}) async {
    await database!
        .rawDelete('DELETE FROM Card WHERE id= ?', [id]).then((value) {
      getCard(database);
      emit(DeleteCardState());
    });
  }
}
