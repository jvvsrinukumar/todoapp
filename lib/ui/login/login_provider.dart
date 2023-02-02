import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/ui/lobby/todo_list.dart';
import 'package:todoapp/ui/lobby/todo_list_provider.dart';
import 'package:todoapp/utlis/navigation_service.dart';
import 'package:todoapp/utlis/validators_utlis.dart';

class LoginProvider extends ChangeNotifier {
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
    } else if (email.isEmpty) {
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

  // Future<bool> checkUserAlreadyLoggedIn() async {
  //   _isLoading = true;
  //   if (auth.currentUser == null) {
  //     _isLoading = false;
  //     notifyListeners();
  //     return false;
  //   } else {
  //     final idTokenResult = await auth.currentUser!.getIdTokenResult(true);
  //     if (idTokenResult.token != null) {
  //       _isLoading = false;
  //       //User? us = auth.currentUser;
  //       //print(us);
  //       notifyListeners();
  //       return true;
  //     } else {
  //       _isLoading = false;
  //       notifyListeners();
  //       return false;
  //     }
  //   }
  // }


   Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      
    }
  }
  
 Future<FirebaseApp> initializeFirebase(

  ) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
       NavigationService().replaceScreen(ChangeNotifierProvider<LobbyProvider>(
              create: (context) => LobbyProvider(), child: const LobbyPage()));
    }

    return firebaseApp;
  }

  Future<UserCredential?> loginWithEmailAndPassword() async {
    _isLoading = true;
    try {
      UserCredential? userCredential = await auth.signInWithEmailAndPassword(
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

  Future<User?> googleLogin() async {
    _isLoading = true;
    notifyListeners();

    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var reslut = await googleSignIn.signIn();
      if (reslut == null) {
        _isLoading = false;
        return null;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      
      _isLoading = false;
      notifyListeners();
      return finalResult.user;
    } catch (error) {
      print(error);
    }
  }
}
