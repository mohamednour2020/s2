import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:s2/custom_widgets/custom_button.dart';
import 'package:s2/custom_widgets/home_card.dart';
import 'package:s2/screens/home_screen.dart';
import 'package:s2/utils/app_images.dart';
import 'package:s2/utils/app_validator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login", style: TextStyle(color: Colors.white)),
      ),
      body: Form(
        key: loginKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppImages.loginImage, height: 300, width: 300),
                TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  validator: (input) {
                   return AppValidator.appValidator(input: input??"", type: ValidationType.email);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.4),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    hintText: "ex : email@email.com",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (input) {
                    return AppValidator.appValidator(input: input??"", type: ValidationType.password);

                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.4),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_open,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    hintText: "******",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
                SizedBox(height: 32),
                CustomButton(
                  onTap: () async{
                    if (loginKey.currentState!.validate()) {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => HomeScreen(),)
                      );
                    }
                  },
                  buttonText: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
