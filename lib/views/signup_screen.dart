import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_project/components/customLoginTextFiled_widget.dart';
import 'package:todoapp_project/components/textStyle_widget.dart';
import 'package:todoapp_project/utils/constants.dart';
import 'package:todoapp_project/view_models/auth_viewmodel.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  void callSignUP(BuildContext context) async {
    await Provider.of<SignUpProvider>(context,listen: false).signupFunction(context: context);
  }

  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   final signUpProvider = Provider.of<SignUpProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  TextStyleWidget(
                    value: "Tell Us About You!",
                    textColor: blackColor,
                    textSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  const Gap(10),
                  TextStyleWidget(
                      value: "Make it work, make it right, make it fast",
                      textColor: blackColor,
                      textSize: 15),
                      const Gap(20),
                  TextFormFieldWidget(
                      controller: signUpProvider.usernameGet,
                      icon: Icons.person,
                      hinttext: "User name",
                      valueKey: "name"),
                  const Gap(20),
                  TextFormFieldWidget(
                      controller: signUpProvider.emailGet,
                      icon: Icons.email_outlined,
                      hinttext: "E-Mail",
                      valueKey: 'email'),
                  const Gap(20),
                  TextFormFieldWidget(
                      controller: signUpProvider.passwordGet,
                      icon: Icons.fingerprint_outlined,
                      hinttext: "Password",
                      valueKey: 'password'),
                  const Gap(30),
                  GestureDetector(
                    onTap: () {
                      callSignUP(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: TextStyleWidget(
                            value: "Register", textColor: whiteColor, textSize: 16),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextStyleWidget(
                          value: "Already have an account?",
                          textColor: blackColor,
                          textSize: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: TextStyleWidget(
                          value: "Login",
                          textColor: blackColor,
                          textSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: signUpProvider.linearPrograss,
                    child: LinearProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
