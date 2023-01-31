
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/utlis/validators_utlis.dart';

class SignInProvider extends ChangeNotifier {
  
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  ValidationItem get email => _email;
  ValidationItem get password => _password;

  bool get isValid {
    if (_email.value != null && _password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void changeEmail(String email) {
    if (ValidationUtil.isValidEmailId(email)) {
      _email = ValidationItem(email, null);
    } else if (email.isEmpty){
      _email = ValidationItem(null, "Email can't be empty");
    } else {
      _email = ValidationItem(null, "Invalid E-mail Address");
    }
    notifyListeners();
  }

  void changePassword(String password) {
    if (password.isEmpty) {
      _password = ValidationItem(null, "Password can't be empty");
    } else {
      _password = ValidationItem(password, null);
    }
    notifyListeners();
  }


  Future<UserCredential?> signInWithEmailAndPassword() async {
    _isLoading = true;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email.value!, password: password.value!);
      _isLoading = false;
     // print(userCredential);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      if (e.code == 'user-not-found') {
        _email = ValidationItem(null, "No user found for that email.");
        notifyListeners();
        return null;
      } else if (e.code == 'wrong-password') {
        _password =
            ValidationItem(null, "Wrong password provided for that user.");
        notifyListeners();
        return null;
      }
    }
    return null;
  }
}
