import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_project/components/textStyle_widget.dart';
import 'package:todoapp_project/views/home_screen.dart';
import 'package:todoapp_project/views/login_screen.dart';

class SplashViewModel extends ChangeNotifier{
  void callNextScreen(BuildContext context){
    Timer(const Duration(seconds: 2), () {
      Widget screen=StreamBuilder(stream: FirebaseAuth.instance.idTokenChanges(), builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.active){
          if(snapshot.hasData){
            return  HomeScreen();
          }else if(snapshot.hasError){
            return Center(child: TextStyleWidget(value: snapshot.error.toString()),);
          }
        }
        if(snapshot.connectionState==ConnectionState.waiting){
         const Center(child: CircularProgressIndicator(),);
        }
        return  LoginScreen();
      },);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => screen,),);
    },);
  }
}