import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/models/cateogory/cate.dart';
import 'package:multikart/shared/components/components.dart';
import 'package:multikart/shared/cubit/cubit.dart';
import 'package:multikart/shared/cubit/states.dart';
import 'package:multikart/shared/styles/colors.dart';

class Cate extends StatelessWidget {
  const Cate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MulikartCubit,MultikartStates>
      (
        listener:(context,state){},
        builder:(context,state){
          var cubit = MulikartCubit.get(context);
          return ListView.separated(
              itemBuilder:(context,index)=>buildCateItem(cubit.cateItems[index]),
              separatorBuilder:(context,index)=>builtDivider(),
              itemCount: cubit.cateItems.length,
          );
        },
    );
  }
  Widget buildCateItem(CategoryModel model)=>InkWell(
    onTap:(){},
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 150,
        color: Colors.grey[300],
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(model.title,style: const TextStyle(
                   fontSize: 18,
                   color: defaultColor,
                 ),
                 ),
                 const SizedBox(
                   height: 10,
                 ),
                 Text(model.description),
               ],
              ),
            ),
            const Spacer(),
            Image(
                image:AssetImage(model.image),
                fit: BoxFit.cover,
              width: 100,

            ),
          ],
        ),
      ),
    ),
  );

}