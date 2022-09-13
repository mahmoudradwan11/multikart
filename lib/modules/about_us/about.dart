import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/shared/components/components.dart';
import 'package:multikart/shared/cubit/cubit.dart';
import 'package:multikart/shared/cubit/states.dart';
import 'package:multikart/shared/styles/colors.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MulikartCubit, MultikartStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MulikartCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Introduction',
                    style: TextStyle(fontSize: 20, fontFamily: 'Jannah'),
                  ),
                  const Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    margin: EdgeInsets.all(0.8),
                    child: Image(
                      image: AssetImage(
                        'images/introduction.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Multikart is premier fashion destination for the latest trends and hottest styles. ',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also repr oduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          color: Colors.grey[200],
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.person),
                                  Text(
                                    '150+ user',
                                    style: TextStyle(color: defaultColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Multikart have 150+ register users online store',
                                style: TextStyle(
                                    fontFamily: 'Jannah', fontSize: 11),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          color: Colors.grey[200],
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.store),
                                  Text(
                                    '50+ stores',
                                    style: TextStyle(color: defaultColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Multikart have 50+ stores worldwide.',
                                style: TextStyle(
                                    fontFamily: 'Jannah', fontSize: 11),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          color: Colors.grey[200],
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.card_giftcard),
                                  Text(
                                    '1.5M+ orders',
                                    style: TextStyle(color: defaultColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Multikart has 1.5M+ total orders till now.',
                                style: TextStyle(
                                    fontFamily: 'Jannah', fontSize: 11),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                            height: 100,
                            color: Colors.grey[200],
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.branding_watermark_outlined),
                                    Text(
                                      '100+ Brands',
                                      style: TextStyle(color: defaultColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Multikart has 100+ brands in our stores.',
                                  style: TextStyle(
                                      fontFamily: 'Jannah', fontSize: 11),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Our Brands',
                    style: TextStyle(fontSize: 20, fontFamily: 'Jannah'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Each Brands have a unique personality and exclusive design. They have the freedom to develop the styles and garments that create the right appeal – and all our Brands are united',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 110,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          buildBrand(cubit.brandItem[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: cubit.brandItem.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
