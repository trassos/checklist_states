import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInService extends ChangeNotifier {
  bool isSigned = false;
  bool isLoading = false;
  String error = '';
  TextEditingController emailController = TextEditingController();
  var user = FirebaseAuth.instance.currentUser;

  Future<void> signinWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    user = FirebaseAuth.instance.currentUser;
  }

  // Future<void> signinWithEmail(BuildContext context) async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text);
  //     user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       Navigator.pushNamed(context, '/checklist');
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       error = 'No user found for that email.';
  //     } else if (e.code == 'wrong-password') {
  //       error = 'Wrong password provided for that user.';
  //     }
  //   }
  // }

  // Future<void> signupWithEmail(BuildContext context) async {
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text);
  //     user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       Navigator.pushNamed(context, '/checklist');
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       error = 'The password provided is too weak.';
  //     } else if (e.code == 'email-already-in-use') {
  //       error = 'The account already exists for that email.';
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
    user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      isSigned = false;
      notifyListeners();
    }
  }
}
