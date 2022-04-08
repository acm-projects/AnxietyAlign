import 'package:flutter/material.dart';
import 'package:counter/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final EdgeInsets buttonPadding = const EdgeInsets.symmetric(
      vertical: 5.0,
      horizontal: 100.0
  );
  final TextEditingController _usernameController = TextEditingController(),
                              _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: const Text('Sign-In'),
            actions: <Widget>[
              TextButton.icon(
                  icon: const Icon(Icons.person, color: Colors.white),
                  label: const Text('Register', style: TextStyle(color: Colors.white)),
                  onPressed: () { widget.toggleView(); }
              )
            ]
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  padding: buttonPadding,
                  child: TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(label: Text('Username or email')),
                      onFieldSubmitted: (text) async {
                        if(_passwordController.text.isEmpty) {
                          return;
                        }
                        await _auth.signInWithUsernameAndPassword(
                            _usernameController.text, _passwordController.text
                        );
                      }
                  )
              ),
            Container(
                padding: buttonPadding,
                child: TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(label: Text('Password')),
                    obscureText: true,
                    onFieldSubmitted: (text) async {
                      if(_usernameController.text.isEmpty) {
                        return;
                      }
                      await _auth.signInWithUsernameAndPassword(
                          _usernameController.text, _passwordController.text
                      );
                    }
                )
            ),
            Container(
                padding: buttonPadding,
                child: ElevatedButton(
                    child: const Text('Sign-in'),
                    onPressed: () async {
                      await _auth.signInWithUsernameAndPassword(
                          _usernameController.text, _passwordController.text
                      );
                    }
                )
            ),
            Container(
              padding: buttonPadding,
              child: const Center(
                child: Text('Or', style: TextStyle(fontStyle: FontStyle.italic))
              )
            ),
            Container(
                padding: buttonPadding,
                child: ElevatedButton(
                    child: const Text('Sign-in anonymously'),
                    onPressed: () async {
                      await _auth.signInAnonymously();
                    }
                )
            )
        ]
      )
    );
  }
}
