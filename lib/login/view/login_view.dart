import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tasks_basic/login/view_model/login_store.dart';
import 'package:tasks_basic/main.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginStore loginStore = LoginStore();
  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
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
                Observer(
                  builder: (_) {
                    return Text(loginStore.fullData,
                        style: customTheme.textTheme.displayLarge);
                  },
                ),
                Text(
                  'E-mail',
                  style: customTheme.textTheme.displaySmall,
                ),
                // if (isSigned) Image.network(user!.photoURL!),
                // if (isSigned) Text(user!.displayName!),
                // if (!isSigned) Container(),
                TextField(
                  onChanged: loginStore.setEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                viewSpacer,
                Text('Password', style: customTheme.textTheme.displaySmall),
                TextField(
                  onChanged: loginStore.setPass,
                  keyboardType: TextInputType.visiblePassword,
                ),
                viewSpacer,
                // isLoading
                //     ? const CircularProgressIndicator()
                // :
                ElevatedButton(
                  style: viewButtonStyle,
                  onPressed: () {},
                  child: const Text('Login'),
                ),
                viewSpacer,
                ElevatedButton(
                  style: viewButtonStyle,
                  onPressed: () {
                    signinWithGoogle(context);
                  },
                  child: const Text('Google Login'),
                ),
                viewSpacer,
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
