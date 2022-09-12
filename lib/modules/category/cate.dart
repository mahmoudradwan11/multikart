import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:multikart/shared/cubit/cubit.dart';
import 'package:multikart/shared/cubit/states.dart';
import 'package:multikart/shared/styles/colors.dart';

class Cate extends StatelessWidget {
  const Cate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MulikartCubit, MultikartStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 150,
                    color: Colors.grey[200],
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'sale',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: defaultColor,
                                    fontFamily: 'Bursh'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'upto 50% off on all products',
                                style: TextStyle(fontFamily: 'Jannah'),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Image(
                          image: AssetImage('images/sale.png'),
                          fit: BoxFit.cover,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 150,
                    color: HexColor('ffe5ea'),
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Image(
                            image: AssetImage('images/wom.png'),
                            fit: BoxFit.cover,
                            width: 100,
                            height: 130,
                          ),
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'WOMEN',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: defaultColor,
                                  fontFamily: 'Bursh'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              't-shirts,tops,bottoms',
                              style: TextStyle(fontFamily: 'Jannah'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 150,
                    color: Colors.grey[200],
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'MEN',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: defaultColor,
                                    fontFamily: 'Bursh'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'jackets,jeans,denims',
                                style: TextStyle(fontFamily: 'Jannah'),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Image(
                          image: AssetImage('images/me.png'),
                          fit: BoxFit.cover,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 150,
                    color: HexColor('ffe5ea'),
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Image(
                            image: AssetImage('images/kid.png'),
                            fit: BoxFit.cover,
                            width: 100,
                            height: 130,
                          ),
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'KIDS',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: defaultColor,
                                  fontFamily: 'Bursh'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'clothing,toys,books',
                              style: TextStyle(fontFamily: 'Jannah'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 150,
                    color: Colors.grey[200],
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'BEAUTY',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: defaultColor,
                                    fontFamily: 'Bursh'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'skincare,haircare,makeup',
                                style: TextStyle(fontFamily: 'Jannah'),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Image(
                          image: AssetImage('images/bea.png'),
                          fit: BoxFit.cover,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 150,
                    color: HexColor('ffe5ea'),
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Image(
                            image: AssetImage('images/footwear.png'),
                            fit: BoxFit.cover,
                            width: 100,
                            height: 130,
                          ),
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'FOOTWEAR',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: defaultColor,
                                  fontFamily: 'Bursh'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'shoes,sandle,activewear',
                              style: TextStyle(fontFamily: 'Jannah'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 150,
                    color: Colors.grey[200],
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'JEWELERY',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: defaultColor,
                                    fontFamily: 'Bursh'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'necklace,chains,earrings',
                                style: TextStyle(fontFamily: 'Jannah'),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Image(
                          image: AssetImage('images/jew.png'),
                          fit: BoxFit.cover,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
