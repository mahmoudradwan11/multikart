import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multikart/shared/components/components.dart';
import 'package:multikart/shared/cubit/cubit.dart';
import 'package:multikart/shared/cubit/states.dart';

class Profile extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MulikartCubit, MultikartStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MulikartCubit.get(context);
          var userModel = cubit.userModel;
          nameController.text = userModel!.name!;
          bioController.text  =userModel.bio!;
          phoneController.text = userModel.phone!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: [
                    if (state is UserUpdateLoading) const LinearProgressIndicator(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height:200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image(image: NetworkImage('${cubit.userModel!.image}'),),
                    ),
            const SizedBox(
              height: 10.0,
            ),
                    textField(
                      show: false,
                      controller:nameController,
                      keyboard:TextInputType.name,
                      valid:(value)
                      {
                        if(value.isEmpty)
                        {
                          return 'Name Must not be Empty';
                        }
                        return null;
                      },
                      label:'Name',
                      prefix:Icons.person,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    textField(
                      show: false,
                      controller:bioController,
                      keyboard:TextInputType.name,
                      valid:(value)
                      {
                        if(value.isEmpty)
                        {
                          return 'Bio Must not be Empty';
                        }
                        return null;
                      },
                      label:'Bio',
                      prefix:Icons.info,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    textField(
                      show: false,
                      controller:phoneController,
                      keyboard:TextInputType.phone,
                      valid:(value)
                      {
                        if(value.isEmpty)
                        {
                          return 'Phone Must not be Empty';
                        }
                        return null;
                      },
                      label:'Phone',
                      prefix:Icons.mobile_friendly,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defButton(function:(){
                      cubit.updateUser(name: nameController.text, phone: phoneController.text, bio: bioController.text);
                    }, text:'Update'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    defButton(function:(){
                      cubit.signOut(context);
                    }, text:'Logout'),
                    const SizedBox(
                      height: 20,
                    ),
                  ]
              ),
            ),
          );
        }
    );
  }
}