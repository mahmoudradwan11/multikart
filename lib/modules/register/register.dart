import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:multikart/layout/layout.dart';
import 'package:multikart/shared/components/components.dart';
import 'package:multikart/shared/styles/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is CreateUserSuccessState) {
            navigateAndFinish(context, const Layout());
            showToast('User Created Successfully', ToastStates.SUCCESS);
          }
        },
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('REGISTER',
                            style: Theme.of(context).textTheme.bodyText1),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Register now to Chats with friends',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.grey,
                                    )),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Neumorphic(
                            style: const NeumorphicStyle(
                              depth: 3,
                              shadowLightColor: defaultColor,
                              shadowDarkColor: defaultColor,
                              color: Colors.white,
                            ),
                            child: textField(
                              labelStyle: Theme.of(context).textTheme.subtitle1,
                              show: false,
                              controller: nameController,
                              keyboard: TextInputType.name,
                              valid: (value) {
                                if (value.isEmpty) {
                                  return 'Name Must not be Empty';
                                }
                                return null;
                              },
                              label: 'Name',
                              prefix: Icons.person,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Neumorphic(
                            style: const NeumorphicStyle(
                              depth: 3,
                              shadowLightColor: defaultColor,
                              shadowDarkColor: defaultColor,
                              color: Colors.white,
                            ),
                            child: textField(
                              labelStyle: Theme.of(context).textTheme.subtitle1,
                              show: false,
                              controller: emailController,
                              keyboard: TextInputType.emailAddress,
                              valid: (value) {
                                if (value.isEmpty) {
                                  return 'Email Must not be Empty';
                                }
                                return null;
                              },
                              label: 'Email Address',
                              prefix: Icons.email,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Neumorphic(
                            style: const NeumorphicStyle(
                              depth: 3,
                              shadowLightColor: defaultColor,
                              shadowDarkColor: defaultColor,
                              color: Colors.white,
                            ),
                            child: textField(
                              labelStyle: Theme.of(context).textTheme.subtitle1,
                              show: cubit.isPassword,
                              suffix: cubit.suffix,
                              suffixPress: () {
                                cubit.changePasswordVisibility();
                              },
                              controller: passwordController,
                              keyboard: TextInputType.visiblePassword,
                              valid: (value) {
                                if (value.isEmpty) {
                                  return 'Password is to short must be more than 5 letter';
                                }
                                return null;
                              },
                              label: 'password',
                              prefix: Icons.lock_outline,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Neumorphic(
                            style: const NeumorphicStyle(
                              depth: 3,
                              shadowLightColor: defaultColor,
                              shadowDarkColor: defaultColor,
                              color: Colors.white,
                            ),
                            child: textField(
                              labelStyle: Theme.of(context).textTheme.subtitle1,
                              show: false,
                              controller: phoneController,
                              keyboard: TextInputType.phone,
                              valid: (value) {
                                if (value.isEmpty) {
                                  return 'phone Must not be Empty';
                                }
                                return null;
                              },
                              label: 'Phone',
                              prefix: Icons.phone,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        if (state is RegisterLoad)
                          const LinearProgressIndicator(),
                        Neumorphic(
                          style: const NeumorphicStyle(
                            depth: 3,
                            shadowLightColor: defaultColor,
                            shadowDarkColor: defaultColor,
                            color: Colors.white,
                          ),
                          child: defButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            text: 'register',
                            isUpper: true,
                            background: Colors.grey[100],
                            color: defaultColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
