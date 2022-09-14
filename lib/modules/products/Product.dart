import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/models/product_model/product_model.dart';
import 'package:multikart/modules/product_details/product_details.dart';
import 'package:multikart/shared/components/components.dart';
import 'package:multikart/shared/cubit/cubit.dart';
import 'package:multikart/shared/cubit/states.dart';
import 'package:multikart/shared/styles/colors.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MulikartCubit, MultikartStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MulikartCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Products',
              style: TextStyle(fontFamily: 'Bursh', fontSize: 35),
            ),
            centerTitle: true,
          ),
          body: ListView.separated(
            itemBuilder: (context, index) =>
                buildProductItem(cubit.products[index], context),
            separatorBuilder: (context, index) => builtDivider(),
            itemCount: cubit.products.length,
          ),
        );
      },
    );
  }

  Widget buildProductItem(ProductModel model, context) => InkWell(
    onTap:(){
      navigateTo(context, ProductDetails(
        model: model,
      ));
    },
    child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                ),
                height: 200,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image(
                          image: AssetImage(model.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          model.brand,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Price : ${model.price}',
                          style: const TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Old-Price : ${model.oldPrice}',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: DropdownButton(
                                items: ["S", "M", "L", "Xl"]
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  MulikartCubit.get(context).selectSize(value);
                                },
                                value: MulikartCubit.get(context).selectedSize,
                              ),
                              //color: Colors.yellow,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: DropdownButton(
                                items: [1, 2, 3, 4, 5, 6, 7, 8]
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text('$e'),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  MulikartCubit.get(context)
                                      .selectQuantity(value);
                                },
                                value:
                                    MulikartCubit.get(context).selectedQuantity,
                              ),
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
                  onPressed: () {
                    MulikartCubit.get(context).insertCard(
                      name: model.name,
                      brand: model.brand,
                      image: model.image,
                      size: MulikartCubit.get(context).selectedSize!,
                      price: model.price,
                      qty: MulikartCubit.get(context).selectedQuantity!,
                      oldPrice: model.oldPrice,
                    );
                    showToast('Added Successfully', ToastStates.SUCCESS);
                  },
                  icon: const Icon(
                    Icons.add,
                    color: defaultColor,
                  ),
                ),
              ),
            ],
          ),
        ),
  );
}
