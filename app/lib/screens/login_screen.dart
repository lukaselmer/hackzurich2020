import 'package:app/resources/firebase_repository.dart';
import 'package:app/util/routing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _repository = FirebaseRepository.instance;

  String _loginError = '';
  bool _isLoginPressed = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            if (_loginError.isNotEmpty) Center(child: Text(_loginError)),
            Center(child: loginButton()),
            _isLoginPressed
                ? Center(child: CircularProgressIndicator())
                : Container()
          ],
        ),
      );

  Widget loginButton() => FlatButton(
        padding: EdgeInsets.all(35),
        child: Text(
          'LOGIN',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        onPressed: performLogin,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      );

  void performLogin() async {
    setState(() {
      _isLoginPressed = true;
      _loginError = '';
    });

    try {
      final user = await _repository.signIn();
      if (user != null) await authenticateUser(user);
    } on Exception catch (e) {
      setState(() => _loginError = e.toString());
    }

    setState(() => _isLoginPressed = false);
  }

  Future<void> authenticateUser(FirebaseUser user) async {
    final isNewUser = await _repository.userIsStored(user);
    if (isNewUser) await _repository.storeUser(user);
    popAll(context);
    await Navigator.popAndPushNamed(context, 'challenges');
  }
}
