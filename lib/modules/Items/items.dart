import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/models/product_model/product_model.dart';
import 'package:multikart/shared/components/components.dart';
import 'package:multikart/shared/cubit/cubit.dart';
import 'package:multikart/shared/cubit/states.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);
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

  Widget buildProductItem(ProductModel model, context) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          Text(
                            'Quantity : ${model.qty}',
                            style: const TextStyle(color: Colors.deepOrange),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Size : ${model.size}',
                            style: const TextStyle(color: Colors.deepOrange),
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
              child: defButton(
                function: () {
                  MulikartCubit.get(context).insertCard(
                    name: model.name,
                    brand: model.brand,
                    image: model.image,
                    size: model.size,
                    price: model.price,
                    qty: model.qty,
                    oldPrice: model.oldPrice,
                  );
                  showToast('Added Successfully', ToastStates.SUCCESS);
                },
                text: 'Add',
                width: 100,
                heigth: 25,
                isUpper: false,
              ),
            ),
          ],
        ),
      );
}
