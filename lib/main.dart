import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_project/view_models/addDataFirebase_viewmodel.dart.dart';
import 'package:todoapp_project/view_models/auth_viewmodel.dart';
import 'package:todoapp_project/view_models/getDataFromFirebase.dart';
import 'package:todoapp_project/view_models/splash_viewmodel.dart';
import 'package:todoapp_project/views/home_screen.dart';
import 'package:todoapp_project/views/login_screen.dart';
import 'package:todoapp_project/views/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashViewModel(),),
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
        ChangeNotifierProvider(create: (context) => SignUpProvider(),),
        ChangeNotifierProvider(create: (context) => GoogleSigningProvider(),),
        ChangeNotifierProvider(create: (context) => PhoneVerificationProvider(),),
        ChangeNotifierProvider(create: (context) => OtpVerification(),),
        ChangeNotifierProvider(create: (context) => LogoutProvider(),),
        ChangeNotifierProvider(create: (context) => AddToFireBaseProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
         // useMaterial3: true,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash' :(context) => const SplashScreen(),
          '/login' : (context)=> LoginScreen(),
          '/home' :(context) => HomeScreen()
        },
      ),
    );
  }
}