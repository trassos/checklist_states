import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tasks_basic/main.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var isSigned = false;
    bool isLoading = false;
    String error = '';
    TextEditingController emailController = TextEditingController();
    var user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: viewPadding,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'E-mail',
                  style: customTheme.textTheme.displaySmall,
                ),
                if (isSigned) Image.network(user!.photoURL!),
                if (isSigned) Text(user!.displayName!),
                if (!isSigned) Container(),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                viewSpacer,
                Text('Password', style: customTheme.textTheme.displaySmall),
                const TextField(
                  keyboardType: TextInputType.visiblePassword,
                ),
                viewSpacer,
                isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        style: viewButtonStyle,
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                ElevatedButton(
                  style: viewButtonStyle,
                  onPressed: () {
                    signinWithGoogle(context);
                  },
                  child: const Text('Google Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signinWithGoogle(BuildContext context) {
    signInWithGoogle().then((userCredential) {
      var user = userCredential.user;
      if (user != null) {
        Navigator.pushNamed(context, '/checklist');
      }
    }).catchError((error) {});
  }
}

const viewPadding =
    EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0, bottom: 24.0);

const viewSpacer = SizedBox(height: 16.0);

ButtonStyle viewButtonStyle = ElevatedButton.styleFrom(
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
  // Once signed in, return the UserCredential

  return userCredential;
}
