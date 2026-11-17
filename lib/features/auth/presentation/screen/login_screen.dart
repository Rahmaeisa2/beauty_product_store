import 'package:beauty_product_store/core/constants/app_color.dart';
import 'package:beauty_product_store/core/widget/custom_text_form_field.dart';
import 'package:beauty_product_store/features/auth/presentation/cubit/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/routes_names.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocConsumer<LoginCubit ,LoginState>(
        listener: (context, state) {
      if (state is LoginSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created successfully'),
          ),
        );
        Navigator.pushReplacementNamed(
          context,
          RouteNames.navBar,
        );
      }

      if (state is LoginError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.message),
          ),
        );
      }
    },
    builder: (context,state) {

    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("welcome again in our store!",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight,
            ),),
            SizedBox(
              height: 12,
            ),
            CustomTextFormField(
              hintText: "Enter Your Email ",
              hintStyle: TextStyle(
                  color: AppColors.grey
              ),
              fillColor: AppColors.background,
              filled: true,
              obscureText: false,
              controller: emailController,
              validator: (w){},

            ),
            SizedBox(
              height: 12,
            ),
            CustomTextFormField(

              hintText: "Enter Your Password ",
              hintStyle: TextStyle(
                color: AppColors.grey
              ),
              obscureText: true,
              fillColor: AppColors.background,
              filled: true,
              controller: passwordController,
              validator: (w){},
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(width: double.infinity,
              text: 'Login',onPressed: () {

                  final cubit = context.read<LoginCubit>();
                  cubit.login(
                    userName: emailController.text,
                    password: passwordController.text,
                  );
                  Navigator.pushReplacementNamed(context, RouteNames.home);
                },),
            TextButton(child : Text("Don't have account ? "),
            onPressed:(){
              Navigator.pushReplacementNamed(
                  context,
                  RouteNames.signup,);
            })
          ],
        ),
      );}
    ));
  }
}










