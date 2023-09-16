import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInService {
  FirebaseAuth auth = FirebaseAuth.instance;
  String error = '';

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential = await auth.signInWithCredential(credential);
    return userCredential;
  }

  Future<UserCredential?> signInWithEmail(
      {required String email, required String pass}) async {
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        error = "Wrong password provided for that user.";
      } else if (e.code == "user-not-found") {
        UserCredential? userCredential =
            await signUpWithEmail(email: email, pass: pass);
        return userCredential;
      } else if (e.code == "invalid-email") {
        error = "Invalid email address.";
      } else if (e.code == "user-disabled") {
        error = "User with this email has been disabled.";
      } else {
        error = e.message!;
      }
      throw Exception(error);
    }
  }

  Future<UserCredential?> signUpWithEmail(
      {required String email, required String pass}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      error = e.message!;
      return null;
    }
  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
