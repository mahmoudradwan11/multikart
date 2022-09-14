import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/models/product_model/product_model.dart';
import 'package:multikart/modules/card/cart.dart';
import 'package:multikart/shared/components/components.dart';
import 'package:multikart/shared/cubit/cubit.dart';
import 'package:multikart/shared/cubit/states.dart';
import 'package:multikart/shared/styles/colors.dart';

class ProductDetails extends StatelessWidget {
  ProductModel? model;
  ProductDetails({Key? key,this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MulikartCubit,MultikartStates>(
        listener:(context,state){},
        builder:(context,state){
          return Scaffold(
            appBar: AppBar(
              title:Text(model!.name),
              actions: [
                IconButton(onPressed:(){
                  navigateTo(context,const CardScreen());
                }, icon:const Icon(Icons.card_giftcard)
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      //elevation: 5.0,
                      margin: const EdgeInsets.all(0.8),
                      child: Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          Image(
                              image: AssetImage(
                                model!.image,
                              ),
                              //height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      model!.name,style:const TextStyle(fontSize: 20,fontFamily: 'Jannah'),),
                    const Text(
                      'Black, off-white and peach-coloured printed, has zip closure, attached lining',style: TextStyle(fontSize: 15,color: Colors.grey),),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(model!.brand),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${model!.price}',
                          style:const TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '\$${model!.oldPrice}',
                          style:const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '20%',
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Size',style:TextStyle(fontSize: 20,fontFamily: 'Jannah'),),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.grey[300],
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'S',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.grey[300],
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'M',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.grey[300],
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'L',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.grey[300],
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'XL',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Color',style:TextStyle(fontSize: 20,fontFamily: 'Jannah'),),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children:[
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: defaultColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blueGrey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.red[900],
                        ),
                       const  SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor:Colors.green[500],
                        ),

                      ],
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
