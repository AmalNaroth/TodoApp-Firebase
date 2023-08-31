import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_project/components/customSnackbar.dart';
import 'package:todoapp_project/components/textStyle_widget.dart';
import 'package:todoapp_project/utils/constants.dart';
import 'package:todoapp_project/view_models/auth_viewmodel.dart';
import 'package:todoapp_project/views/home_screen.dart';

class OtpVerify extends StatelessWidget {
  OtpVerify({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final otpProvider=Provider.of<OtpVerification>(context);
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      body: Form(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextStyleWidget(
                  value: "Phone Verification",
                  textColor: Colors.black,
                  textSize: 30,
                  fontWeight: FontWeight.bold),
              const Gap(30),
              const Text(
                "We need to register your phone before getting started!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              Pinput(
                length: 6,
                defaultPinTheme: PinTheme(
                    textStyle: TextStyle(fontSize: 30),
                    height: screenWidth * .3 / 2,
                    width: screenWidth * .3 / 2,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 158, 158, 158),
                    )),
                showCursor: true,
                onChanged: (value) {
                  otpProvider.otpSet=value;
                },
              ),
              const Gap(20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15)),
                onPressed: () {
                   otpProvider.otpvarification(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextStyleWidget(
                        value: "Verify phone number",
                        textColor: Colors.white,
                        textSize: 18),
                  ],
                ),
              ),
              Gap(25),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: TextStyleWidget(
                      value: "Edit Phone Number?",
                      textColor: blackColor,
                      textSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              )
            ],
          ),
        )),
      ),
    );
  }
}

