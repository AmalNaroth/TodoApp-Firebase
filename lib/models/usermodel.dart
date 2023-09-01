import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userName;
  String userEmail;
  UserModel({
    required this.userName,
    required this.userEmail,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userEmail': userEmail,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'] as String,
      userEmail: map['userEmail'] as String,
    );
  }
}
