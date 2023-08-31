import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_project/components/textStyle_widget.dart';
import 'package:todoapp_project/view_models/splash_viewmodel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashViewModel>().callNextScreen(context);
    return  Scaffold(
      body: Center(
        child: TextStyleWidget(value: "MY TO DO",fontWeight: FontWeight.bold,textSize: 50,),
      ),
    );
  }
}