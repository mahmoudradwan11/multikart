import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/shared/components/components.dart';
import 'package:multikart/shared/cubit/cubit.dart';
import 'package:multikart/shared/cubit/states.dart';
import 'package:multikart/shared/styles/colors.dart';

class Wish extends StatelessWidget {
  //final String? image;
  const Wish({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MulikartCubit, MultikartStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MulikartCubit.get(context);
        var wish = cubit.wish;
        if (wish.isEmpty) {
          return const Center(
              child: Text(
                'Add Some Wish Item',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            );
        } else {
          return ListView.separated(
                itemBuilder: (context, index) =>
                    builtWishItem(wish[index], context),
                separatorBuilder: (context, index) => builtDivider(),
                itemCount: wish.length
          );
        }
      },
    );
  }
  Widget builtWishItem(Map model, context) => Padding(
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
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(icon:const Icon(Icons.restore_from_trash,color: defaultColor,),onPressed:(){
            MulikartCubit.get(context).deleteWish(id:model['id']);
            showToast('Deleted Successfully',ToastStates.ERROR);
          },
          ),
        ),
      ],
    ),
  );
}
