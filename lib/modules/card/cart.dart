import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            body: ListView.separated(
                itemBuilder: (context, index) =>
                    builtCardItem(card[index], context),
                separatorBuilder: (context, index) => builtDivider(),
                itemCount: card.length),
          );
        }
      },
    );
  }

  Widget builtCardItem(Map model, context) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Stack(
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
    ),
  );
}
