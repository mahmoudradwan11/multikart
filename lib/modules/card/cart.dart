import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/modules/apply_coupon/apply_coupon.dart';
import 'package:multikart/shared/components/components.dart';
import 'package:multikart/shared/cubit/cubit.dart';
import 'package:multikart/shared/cubit/states.dart';
import 'package:multikart/shared/styles/colors.dart';

class CardScreen extends StatelessWidget {
  //final String? image;
  const CardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MulikartCubit, MultikartStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MulikartCubit.get(context);
        var card = cubit.card;
        if (card.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'My Card',
                style: TextStyle(fontFamily: 'Bursh', fontSize: 35),
              ),
              centerTitle: true,
            ),
            body: const Center(
              child: Text(
                'Add Some Card Item',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Card'),
              centerTitle: true,
            ),
            body:Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => builtCardItem(card[index], context),
                        separatorBuilder: (context, index) => builtDivider(),
                        itemCount: card.length),
                    const Text(
                      'Coupons:',style: TextStyle(
                      fontFamily: 'Jannah',
                      fontSize: 20,
                    ),
                    ),
                    Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Apply Coupon',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(Icons.discount),
                            suffixIcon: Icon(Icons.arrow_forward_ios),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'OrderDetails:',style: TextStyle(
                      fontFamily: 'Jannah',
                      fontSize: 20,
                    ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children:[
                            const Text('Bag Total',style: TextStyle(color: Colors.grey,fontSize: 15),),
                            const Spacer(),
                            Text('\$${cubit.card[0]['oldPrice']}',style:const TextStyle(color: Colors.black,fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children:[
                            const Text('Bag savings',style: TextStyle(color: Colors.grey,fontSize: 15),),
                            const Spacer(),
                            Text('\$${cubit.card[0]['oldPrice']-cubit.card[0]['price'
                            ]}',style:const TextStyle(color: Colors.black,fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children:[
                            const Text('Coupon Discount',style: TextStyle(color: Colors.grey,fontSize: 15),),
                            const Spacer(),
                            InkWell(
                                onTap: (){
                                  navigateTo(context,const ApplyCoupon());
                                },
                                child:const Text('Apply Coupon',style: TextStyle(color: Colors.deepOrange,fontSize: 15),)),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children:const[
                             Text('Delivery',style: TextStyle(color: Colors.grey,fontSize: 15),),
                             Spacer(),
                             Text('\$50',style:TextStyle(color: Colors.black,fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey[200],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children:[
                            const Text('Total',style: TextStyle(color: Colors.grey,fontSize: 15),),
                            const Spacer(),
                            Text('\$${cubit.card[0]['price']+50}',style:const TextStyle(color: Colors.black,fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          color: Colors.grey[200],
                          child: Row(
                            children:const[
                              Icon(Icons.note),
                              SizedBox(
                                width: 10,
                              ),
                              Text('No Delivery Charges applied on this order',style: TextStyle(
                                fontFamily: 'Jannah',
                              ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 100,
                          color: Colors.white,
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:const[
                                      Icon(Icons.assignment_return,size: 50,),
                                      Text('Return',style: TextStyle(fontWeight: FontWeight.bold,fontFamily:'Jannah'))
                                    ],
                                  ),
                                ), 
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:const[
                                      Icon(Icons.call,size: 50,),
                                      Text('support',style: TextStyle(fontWeight: FontWeight.bold,fontFamily:'Jannah'))
                                    ],
                                  ),
                                ), 
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:const[
                                      Icon(Icons.payment,size: 50,),
                                      Text('Payment',style: TextStyle(fontWeight: FontWeight.bold,fontFamily:'Jannah'),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                         color: Colors.grey[100],
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('\$${cubit.card[0]['price']+50}.00',style:const TextStyle(color: Colors.black,fontSize: 20)
                                    ),
                                    InkWell(
                                      child: const Text('View Details',style: TextStyle(color: defaultColor),),
                                      onTap:(){},
                                    )
                                  ],
                                ),
                              ), 
                              Expanded(child: defButton(function:(){}, text:'Place Order',width: 100))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          );
        }
      },
    );
  }

  Widget builtCardItem(Map model, context) => Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
          ),
          height: 150,
          width: double.infinity,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:  Image(
                    image: AssetImage(model['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    model['brand'],
                    style:const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${model['price']}',
                        style:const TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '\$${model['oldPrice']}',
                        style:const TextStyle(
                          decoration:
                          TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        model['size'],
                        style: const TextStyle(
                            color: Colors.deepOrange),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${model['qty']}',
                        style: const TextStyle(
                            color: Colors.deepOrange),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon:const Icon(Icons.favorite_border,color: defaultColor,
          ),onPressed:(){
            MulikartCubit.get(context).insertWish(
                name:model['name'],
                brand:model['brand'],
                price:model['price'],
                image:model['image'],
                oldPrice:model['oldPrice']
            );
            showToast('Added Successfully',ToastStates.SUCCESS);
          },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical:8),
          child: IconButton(icon:const Icon(Icons.restore_from_trash,color: defaultColor,),onPressed:(){
            MulikartCubit.get(context).deleteCard(id:model['id']);
            showToast('Deleted Successfully',ToastStates.ERROR);
          },
          ),
        ),
      ],
  );
}
