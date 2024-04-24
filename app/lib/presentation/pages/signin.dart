import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:
              ElevatedButton(onPressed: () => logout(context), child: const Text("logout"))),
    );
  }

  void logout(BuildContext context) {
    Navigator.pop(context);
  }
}
