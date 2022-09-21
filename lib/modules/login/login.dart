import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:multikart/layout/layout.dart';
import 'package:multikart/modules/register/register.dart';
import 'package:multikart/shared/components/components.dart';
import 'package:multikart/shared/network/local/cache_helper.dart';
import 'package:multikart/shared/styles/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is LoginSuccessState) {
          CacheHelper.saveData(
            key: 'uId',
            value: state.uid,
          ).then((value) {
            showToast('Login Successfully', ToastStates.SUCCESS);
            navigateAndFinish(context, const Layout());
          });
        }
      }, builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          backgroundColor:Colors.white,
          body: Center(
            child: SingleChildScrollView(
              child: Stack(
              children:[
                const Positioned(
                  top:55,
                left: -80,
              child:CircleAvatar(
                  radius:80,
                  backgroundColor: defaultColor,
                ),
                ),
                const Positioned(
                  top:55,
                  right: -80,
                  child:CircleAvatar(
                    radius:80,
                    backgroundColor: defaultColor,
                  ),
                ),
                const Positioned(
                  top:55,
                  left: 80,
                  child:CircleAvatar(
                    radius:40,
                    backgroundColor: defaultColor,
                  ),
                ),
                const Positioned(
                  top:500,
                  right: -80,
                  child:CircleAvatar(
                    radius:60,
                    backgroundColor: defaultColor,
                  ),
                ),
                Expanded(
                  child: Container(
                     height: 650,
                     width: 390,
                    ),
                ),
                const Positioned(
                  top: 145,
                  left: 130,
                  child: Text(
                  'Login',style: TextStyle(color: defaultColor,fontSize: 40),
                ),
                ),
                Positioned(
                  top: 200,
                  left: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    height:450,
                    width: 300,
                    child:Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Username',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: textField(
                                labelStyle: const TextStyle(
                                  fontSize: 10,
                                ),
                                show: false,
                                controller: emailController,
                                keyboard: TextInputType.emailAddress,
                                valid: (value) {
                                  if (value.isEmpty) {
                                    return 'Email Must not be Empty';
                                  }
                                  return null;
                                },
                                //label: 'Email',
                                //prefix: Icons.email_outlined,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Password',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: textField(
                                labelStyle:const TextStyle(fontSize: 10),
                                show: cubit.passwordShow,
                                suffix: cubit.suffixIcon,
                                suffixPress: () {
                                  cubit.changePasswordIcon();
                                },
                                controller: passwordController,
                                keyboard: TextInputType.visiblePassword,
                                valid: (value) {
                                  if (value.isEmpty) {
                                    return 'Password is to short';
                                  }
                                  return null;
                                },
                                //label: 'password',
                                //prefix:,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            if (state is LoadingLogin)
                              const LinearProgressIndicator(),
                            const SizedBox(
                              height: 10,
                            ),
                            Neumorphic(
                              style: const NeumorphicStyle(
                                depth: 3,
                                shadowLightColor: defaultColor,
                                shadowDarkColor: defaultColor,
                                color: Colors.white,
                              ),
                              child:
                               defButton(
                                  function: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.loginUser(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  },
                                  text: 'LOGIN',
                                  color: defaultColor,
                                  isUpper: true,
                                  background: Colors.grey[100],
                                ),
                              ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an Account?',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        textButton(
                            text: 'Register ',
                            function: () {
                              navigateTo(context, RegisterScreen());
                            }),
                      ],
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        const SizedBox(
                        height: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          // cubit.signInWithGoogle();
                        },
                        icon: const Image(
                          image: AssetImage('images/google.png'),
                        ),
                      ),
                          ],
                  ),
                      ),
                    ],
                    ),
                ),
                ),
                  ),
                ),
              ],
              ),
            ),
          ),
        );
      }),
    );
  }
}


