import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_project/components/customSnackbar.dart';
import 'package:todoapp_project/views/home_screen.dart';
import 'package:todoapp_project/views/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todoapp_project/views/mobile_verification/otpverify_screen.dart';


//login
class LoginProvider extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? cred;
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passWordController = TextEditingController();
  bool isLoading = false;

  TextEditingController get emailGet => _emailContoller;
  TextEditingController get passwordGet => _passWordController;
  bool get linearPrograss => isLoading;

  Future<void> LoginFunction(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    if (_emailContoller.text.isNotEmpty &&
        _passWordController.text.isNotEmpty) {
      try {
        cred = await _auth.signInWithEmailAndPassword(
            email: _emailContoller.text, password: _passWordController.text);
        customSnackBAr("Login Success", context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
        _emailContoller.clear();
        _passWordController.clear();
      } catch (err) {
        customSnackBAr(err.toString(), context);
      }
    } else {
      customSnackBAr("Enter all the details", context);
    }
    isLoading = false;
    notifyListeners();
  }
}


//singup
class SignUpProvider extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passWordController = TextEditingController();
  UserCredential ? cred;

  bool isLoading=false;

  TextEditingController get emailGet => _emailContoller;
  TextEditingController get passwordGet => _passWordController;
  bool get linearPrograss=>isLoading;

  Future<void> signupFunction({required BuildContext context}) async{
    if(_emailContoller.text.isNotEmpty && _passWordController.text.isNotEmpty){
      isLoading=true;
      notifyListeners();
      try{
        cred=await _auth.createUserWithEmailAndPassword(email: _emailContoller.text, password: _passWordController.text);
        customSnackBAr("Signup Success", context);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(),));
        _emailContoller.clear();
        _passWordController.clear();
      }catch(err){
        customSnackBAr(err.toString(), context);
        notifyListeners();
      }
    }else{
      customSnackBAr("Enter all the details", context);
    }
    isLoading=false;
    notifyListeners();
  }
}


//google singin
class GoogleSigningProvider extends ChangeNotifier {
  FirebaseAuth _auth=FirebaseAuth.instance;
  final _googleSignin=GoogleSignIn();
  
  Future<void> signIngWithGoogleFunction(BuildContext context) async{
     try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignin.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _auth.signInWithCredential(authCredential);
        if (_auth.currentUser!.emailVerified == true ||
            _auth.currentUser != null) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(),));
          customSnackBAr("Login success", context);
        } else {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(),));
          customSnackBAr("Login Fail", context);
        }
        notifyListeners();
      }
    } on FirebaseAuth catch (err) {
      // Get.snackbar("Message", "$e.Message");
      customSnackBAr(err.toString(), context);
      notifyListeners();
      throw err;
    }
  }
  notifyListeners();
}



//phonenumberverification
class PhoneVerificationProvider extends ChangeNotifier {
  String counteryCode = "+91";

  TextEditingController _phoneNumberConteoller = TextEditingController();

  TextEditingController get phoneNumberGet => _phoneNumberConteoller;

  String _varification = "";
  bool isLoading = false;

  String get verificationGet => _varification;

  void mobileVerify(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    if (_phoneNumberConteoller.text.isEmpty) {
      customSnackBAr("Enter mobile number", context);
    } else if (_phoneNumberConteoller.text.length == 10) {
      try {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: counteryCode + _phoneNumberConteoller.text,
          verificationCompleted: (PhoneAuthCredential credential) {
            customSnackBAr("Your mobile verified", context);
          },
          verificationFailed: (FirebaseAuthException e) {
            customSnackBAr(
                "We have blocked all requests from this device due to unusual activity. Try again later.",
                context);
          },
          codeSent: (String verificationId, int? resendToken) {
            _varification = verificationId;
            _phoneNumberConteoller.clear();
            notifyListeners();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OtpVerify(),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } catch (err) {
        customSnackBAr("Something error!", context);
      }
    } else {
      customSnackBAr("Enter full mobile number", context);
    }
    isLoading = false;
    notifyListeners();
  }
}


//otp verification
class OtpVerification extends ChangeNotifier{
  FirebaseAuth _auth = FirebaseAuth.instance;

  String OTP = "";

   set otpSet(String otp){
    OTP=otp;
   }

  Future<void> otpvarification(BuildContext context) async {
      final phoneVerification=Provider.of<PhoneVerificationProvider>(context,listen: false);
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: phoneVerification.verificationGet, smsCode: OTP);
      await _auth.signInWithCredential(credential);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      customSnackBAr("OTP varified", context);
    } catch (e) {
      customSnackBAr("Please check the OTP and enter correct", context);
    }
    notifyListeners();
  }
}

//logout
class LogoutProvider extends ChangeNotifier{
  FirebaseAuth _auth=FirebaseAuth.instance;
  final _googleSign=GoogleSignIn();
  Future<void>logoutFunction(BuildContext context) async{
   try{
    await _auth.signOut();
    await _googleSign.signOut();
    customSnackBAr("Signout success", context);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(),));
    notifyListeners();
   }catch(err){
    customSnackBAr(err.toString(), context);
    notifyListeners();
   }
   notifyListeners();
  }
}