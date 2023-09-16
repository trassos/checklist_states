import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasks_basic/counter/view/counter_view.dart';
import 'package:tasks_basic/login/model/singin_service.dart';
import 'package:tasks_basic/login/view_model/text_form_field_store.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  SignInService signInService = SignInService();
  TextFormFieldStore textFormFieldStore = TextFormFieldStore();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final photoURL = auth.currentUser?.photoURL;
    final displayName = auth.currentUser?.displayName;

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
                photoAndNameBuilder(photoURL, displayName, context),
                viewSpacer,
                loginOrNextButtonsBuilder(context),
                viewSpacer,
                Observer(
                  builder: (_) => _textFieldBuilder(
                      label: 'Email',
                      onChanged: textFormFieldStore.loginStore.setEmail,
                      validator: textFormFieldStore.validateEmail),
                ),
                viewSpacer,
                Observer(
                  builder: (_) => _textFieldBuilder(
                      label: 'Password',
                      onChanged: textFormFieldStore.loginStore.setPass,
                      validator: textFormFieldStore.validatePass),
                ),
                viewSpacer,
                Observer(builder: (_) {
                  if (!textFormFieldStore.loginStore.isSigned) {
                    return ElevatedButton(
                      style: viewButtonStyle,
                      onPressed: () {
                        signinWithGoogle();
                      },
                      child: const Text('Google Login'),
                    );
                  }
                  return Container();
                }),
                viewSpacer,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Observer photoAndNameBuilder(
      String? photoURL, String? displayName, BuildContext context) {
    print(photoURL);
    return Observer(builder: (_) {
      if (textFormFieldStore.loginStore.isSigned) {
        return Column(children: [
          if (photoURL != null)
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(photoURL.toString()),
            ),
          viewSpacer,
          if (displayName != null) Text(displayName),
        ]);
      }
      return Container();
    });
  }

  Observer loginOrNextButtonsBuilder(context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          if (textFormFieldStore.loginStore.isSigned)
            Column(
              children: [
                ElevatedButton(
                  style: viewButtonStyle,
                  child: const Text('Next'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CounterView()),
                    );
                  },
                ),
                viewSpacer,
                ElevatedButton(
                  style: viewButtonStyle,
                  child: const Text('Sign Out'),
                  onPressed: () {
                    signOut();
                  },
                ),
              ],
            )
          else
            ElevatedButton(
              style: viewButtonStyle,
              onPressed: textFormFieldStore.isFormValid
                  ? () => signInWithEmail()
                  : null,
              child: const Text('Login'),
            ),
        ],
      );
    });
  }

  void signinWithGoogle() {
    signInService.signInWithGoogle().then((userCredential) {
      var user = userCredential.user;
      textFormFieldStore.loginStore.setIsSigned(true);
      setState(() {});
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const CounterView()));
      }
    }).catchError((error) {});
  }

  void signInWithEmail() {
    signInService
        .signInWithEmail(
            email: textFormFieldStore.loginStore.email,
            pass: textFormFieldStore.loginStore.password)
        .then((userCredential) {
      if (userCredential != null) {
        var user = userCredential.user;
        textFormFieldStore.loginStore.setIsSigned(true);
        setState(() {});
        if (user != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const CounterView()));
        }
      }
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    });
  }

  void signOut() {
    signInService.signout().then((value) {
      textFormFieldStore.loginStore.setIsSigned(false);
    }).catchError((error) {});
  }

  Widget _textFieldBuilder(
      {required String label,
      onChanged,
      required String? Function(String?) validator}) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => validator(value),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onChanged: onChanged,
    );
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
