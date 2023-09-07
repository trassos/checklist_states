import 'package:flutter/material.dart';
import 'package:tasks_basic/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    String error = '';

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
                const TextField(
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
              ],
            ),
          ),
        ),
      ),
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
