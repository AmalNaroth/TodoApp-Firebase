import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_project/components/textStyle_widget.dart';
import 'package:todoapp_project/utils/constants.dart';
import 'package:todoapp_project/view_models/auth_viewmodel.dart';

class MobileOTP1 extends StatelessWidget {
  MobileOTP1({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PhoneVerificationProvider>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextStyleWidget(
                  value: "Phone Verification",
                  textColor: blackColor,
                  textSize: 30,
                  fontWeight: FontWeight.bold),
              const Gap(30),
              Text(
                "We need to register your phone before getting started!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Gap(10),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "+91"),
                        keyboardType: TextInputType.none,
                      ),
                    ),
                    TextStyleWidget(value: "|", textColor: blackColor, textSize: 20),
                    const Gap(10),
                    Expanded(
                      child: TextField(
                        controller: value.phoneNumberGet,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          counterText: "",
                        ),
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15)),
                onPressed: () {
                  value.mobileVerify(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextStyleWidget(
                        value: "Send the code", textColor: whiteColor, textSize: 18)
                  ],
                ),
              ),
              const Gap(50),
              Visibility(
                  visible: value.isLoading, child: LinearProgressIndicator())
            ],
          ),
        )),
      ),
    );
  }
}
