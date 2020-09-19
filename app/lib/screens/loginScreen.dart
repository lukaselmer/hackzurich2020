import 'package:app/resources/fbRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../challenges/challenge_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  FirebaseRepository _repository = FirebaseRepository();

  bool isLoginPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: UniversalVariables.blackColor,
      body: Stack(
        children: [
          Center(
            child: loginButton(),
          ),
          isLoginPressed
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container()
        ],
      ),
    );
  }

  Widget loginButton() {
    return FlatButton(
      padding: EdgeInsets.all(35),
      child: Text(
        "LOGIN",
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.w900, letterSpacing: 1.2),
      ),
      onPressed: () => performLogin(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  void performLogin() {
    print("tring to perform login");

    setState(() {
      isLoginPressed = true;
    });

    _repository.signIn().then((FirebaseUser user) {
      if (user != null) {
        authenticateUser(user);
      } else {
        print("There was an error");
      }
    });
  }

  void authenticateUser(FirebaseUser user) {
    _repository.authenticateUser(user).then((isNewUser) {
      setState(() {
        isLoginPressed = false;
      });

      if (isNewUser) {
        _repository.addDataToDb(user).then((value) {
          Navigator.push<MaterialPageRoute>(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ChallengePage(),
            ),
          );
        });
      } else {
        Navigator.push<MaterialPageRoute>(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ChallengePage(),
          ),
        );
      }
    });
  }
}
