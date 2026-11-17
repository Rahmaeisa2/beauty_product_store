import 'package:beauty_product_store/core/widget/custom_elevated_button.dart';
import 'package:beauty_product_store/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:beauty_product_store/features/auth/presentation/cubit/signup_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/routes/routes_names.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  bool _hasMinLength = false;
  bool _hasUppercase = false;
  bool _hasNumber = false;
  bool _hasSpecialCharacter = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController.addListener(_validatePassword);

  }
  @override
  void dispose() {
    passwordController.removeListener(_validatePassword);

    passwordController.dispose();
    nameController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
    numberController.dispose();

    super.dispose();
  }
  void _validatePassword() {
    final password = passwordController.text;

    setState(() {
      _hasMinLength = password.length >= 8;

      _hasUppercase =
          RegExp(r'[A-Z]').hasMatch(password);

      _hasNumber =
          RegExp(r'[0-9]').hasMatch(password);

      _hasSpecialCharacter =
          RegExp(r'[!@#$%^&*(),.?":{}|<>_\-\\/\[\]]')
              .hasMatch(password);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,

      body:
      BlocConsumer<SignupCubit ,SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Account created successfully'),
                ),
              );
              Navigator.pushReplacementNamed(
                context,
                RouteNames.home,
              );
            }

            if (state is SignUpError) {
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
            vertical: 46
        ),
        child: Column(
          children: [
            Text("Create Your Account" ,
            style: TextStyle(
              color: AppColors.textLight,
              fontSize: 26,

              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 7,),
            Text("Your journey to glowing skin starts here." ,
              style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),),
            SizedBox(
              height: 20,
            ),

            CustomTextFormField(
              controller: nameController,
              hintStyle: TextStyle(
                color: AppColors.textLight
              ),
              hintText: "Enter your name",
            ),
            SizedBox(height: 12,),
            CustomTextFormField(
              controller: emailController,
              hintText: "Enter your email",
            ),
            SizedBox(height: 12,),

            CustomTextFormField(
              controller: passwordController,
              hintText: "Enter your password",
            ),
            SizedBox(height: 12,),

            CustomTextFormField(
              controller: passwordController ,
              hintText: "confirm password",
            ),
            SizedBox(height: 12,),

            CustomTextFormField(
              controller: numberController,
              hintText: "Enter your number",
            ),
            SizedBox(height: 12,),

            CustomButton(width: double.infinity,
                text: "Create Account ", onPressed: (){
              final cubit = context.read<SignupCubit>();
              cubit.signUp(
                password: passwordController.text,
                username: emailController.text, Name: nameController.text,
                 email: emailController.text,

              );
            }),
            Row(
              children:[
                Text ("Already have an account",
                style:TextStyle(
                  fontSize:20,
                )),
                TextButton(onPressed :()
                {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNames.login,
                  );
                }, child: Text("Login"),)
              ]
            )
          ]
        ),
      );}
    ));
  }
}
Widget passwordRequirement(
    String text,
    bool isValid,
    ) {
  return Row(
    children: [
      Icon(
        isValid
            ? Icons.check_circle
            : Icons.circle_outlined,
        color: isValid
            ? Colors.green
            : Colors.grey,
      ),
      const SizedBox(width: 8),
      Text(text),
    ],
  );
}
