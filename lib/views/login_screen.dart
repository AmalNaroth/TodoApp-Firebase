import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_project/components/customLoginTextFiled_widget.dart';
import 'package:todoapp_project/components/textStyle_widget.dart';
import 'package:todoapp_project/utils/constants.dart';
import 'package:todoapp_project/view_models/auth_viewmodel.dart';
import 'package:todoapp_project/views/mobile_verification/mobileotp_screen.dart';
import 'package:todoapp_project/views/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  void movetoSignPp(BuildContext context) {
    final signUp = MaterialPageRoute(
      builder: (context) => SignUpScreen(),
    );
    Navigator.of(context).push(signUp);
  }

  void callLoginFunction(BuildContext context) async{
    await Provider.of<LoginProvider>(context,listen: false).LoginFunction(context);
  }

  @override
  Widget build(BuildContext context) {
    final signingProvider=Provider.of<LoginProvider>(context);
    final googleSigninProvider=Provider.of<GoogleSigningProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                const Gap(50),
                TextStyleWidget(
                  value: "Welcome Back!",
                  textColor: blackColor,
                  textSize: 30,
                  fontWeight: FontWeight.w500,
                ),
                const Gap(10),
                TextStyleWidget(
                    value: "Make it work, make it right, make it fast",
                    textColor: blackColor,
                    textSize: 15),
                const Gap(20),
                TextFormFieldWidget(
                    controller: signingProvider.emailGet,
                    icon: Icons.email_outlined,
                    hinttext: "E-Mail"),
                const Gap(20),
                TextFormFieldWidget(
                    controller: signingProvider.passwordGet,
                    icon: Icons.fingerprint_outlined,
                    suffixIconTrue: Icons.visibility_off_outlined,
                    suffixIconFalse: Icons.visibility_outlined,
                    hinttext: "Password"),
                const Gap(10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      
                    },
                    child: TextStyleWidget(
                      value: "Foregot password?",
                      textColor: blackColor,
                      textSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Gap(10),
                GestureDetector(
                  onTap: () {
                    callLoginFunction(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: TextStyleWidget(
                          value: "Login", textColor: whiteColor, textSize: 16),
                    ),
                  ),
                ),
                const Gap(25),
                Center(
                    child: TextStyleWidget(
                        value: "OR", textColor: blackColor, textSize: 15)),
                const Gap(25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: Color.fromARGB(255, 214, 214, 214),
                    elevation: 0,
                    side: BorderSide(width: 1),
                  ),
                  onPressed: () async {
                   await googleSigninProvider.signIngWithGoogleFunction(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/google-logo.png",
                        height: 30,
                      ),
                      const Gap(20),
                      TextStyleWidget(
                          value: "Login with google",
                          textColor: blackColor,
                          textSize: 15)
                    ],
                  ),
                ),
                const Gap(20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: Color.fromARGB(255, 214, 214, 214),
                    elevation: 0,
                    side: BorderSide(width: 1),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MobileOTP1(),
                    ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone_iphone_outlined,
                        color: Color.fromARGB(255, 0, 13, 113),
                      ),
                      const Gap(20),
                      TextStyleWidget(
                          value: "Login with mobile",
                          textColor: blackColor,
                          textSize: 15),
                    ],
                  ),
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextStyleWidget(
                        value: "Don't have an account?",
                        textColor: blackColor,
                        textSize: 15),
                    TextButton(
                        onPressed: () {
                          movetoSignPp(context);
                        },
                        child: TextStyleWidget(
                          value: "Register",
                          textColor: blackColor,
                          textSize: 15,
                          fontWeight: FontWeight.w600,
                        ))
                  ],
                ),
                Visibility(
                  visible: signingProvider.linearPrograss,
                  child: LinearProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
