import 'package:app/env.dart';
import 'package:app/presentation/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static final GoogleSignIn _googleSignIn =
      GoogleSignIn(scopes: ['email', 'profile', 'openid'], serverClientId: SERVER_CLIENT_ID);

  // static final GoogleSignIn _googleSignIn =
  //     GoogleSignIn(scopes: ['email', 'profile', 'openid']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
              onPressed: () => signin(context),
              child: const Text("Sign in with Google")),

              // signout
              ElevatedButton(
              onPressed: _googleSignIn.signOut,
              child: const Text("Signout"))
            ],
          )),
    );
  }

  void signin(BuildContext context) async {
    print("Signing in");

    try {
      GoogleSignInAccount? user = await _googleSignIn.signIn();

      GoogleSignInAuthentication auth =
          await _googleSignIn.currentUser!.authentication;

      var accessToken = auth.accessToken;
      var idToken = auth.idToken;

      print("Access token: $accessToken\nidToken: $idToken");

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text("success"), content: Text(user.toString()));
          });

      print("::: User is $user");
    } catch (e) {
      print("Error is $e");
    }

    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const SigninPage()));
  }
}
