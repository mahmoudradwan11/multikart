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
                'Add Some Card Items',
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
                    builtCredItem(card[index], context),
                separatorBuilder: (context, index) => builtDivider(),
                itemCount: card.length),
          );
        }
      },
    );
  }

  Widget builtCredItem(Map model, context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 250,
          //color: Colors.black,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name : ${model['name']}'),
                      const SizedBox(
                        height: 3,
                      ),
                      Text('Brand : ${model['brand']}'),
                      const SizedBox(
                        height: 3,
                      ),
                      Text('Price : ${model['price']}'),
                      const SizedBox(
                        height: 3,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text('OldPrice : ${model['oldPrice']}'),
                      const SizedBox(
                        height: 3,
                      ),
                      Text('Quantity : ${model['qty']}'),
                      const SizedBox(
                        height: 3,
                      ),
                      Text('Size: ${model['size']}'),
                    ],
                  ),
                ),
                //const Spacer(),
                Expanded(
                  child: Container(
                      height: 200,
                      width: 00,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('${model['image']}'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: defButton(
                      width: 200,
                      function: () {
                        showToast('Item Will Arrive on your address',
                            ToastStates.SUCCESS);
                      },
                      text: 'buy now '),
                ),
                const Spacer(),
                Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {
                        MulikartCubit.get(context).deleteCard(id: model['id']);
                        showToast('Deleted Successfully', ToastStates.ERROR);
                      },
                      icon: const Icon(
                        Icons.restore_from_trash,
                        color: defaultColor,
                      ),
                    )),
                //const Spacer(),
              ],
            ),
          ]),
        ),
      );
}
