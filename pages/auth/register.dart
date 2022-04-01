import 'package:counter/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final EdgeInsets buttonPadding = const EdgeInsets.symmetric(
      vertical: 5.0,
      horizontal: 100.0
  );
  final TextEditingController _emailController = TextEditingController(),
                              _usernameController = TextEditingController(),
                              _passwordController = TextEditingController(),
                              _confirmPasswordController = TextEditingController();
  bool _formsFilled() {
    if(_emailController.text.isEmpty || _usernameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _passwordController.text != _confirmPasswordController.text) {
      return false;
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: const Text('Register'),
            actions: <Widget>[
              TextButton.icon(
                  icon: const Icon(Icons.person, color: Colors.white),
                  label: const Text('Sign-In', style: TextStyle(color: Colors.white)),
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
                      controller: _emailController,
                      decoration: const InputDecoration(label: Text('Email')),
                      onFieldSubmitted: (text) async {
                        if(!_formsFilled()) {
                          return;
                        }
                        await _auth.register(_emailController.text, _usernameController.text, _passwordController.text);
                      }
                  )
              ),
              Container(
                  padding: buttonPadding,
                  child: TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(label: Text('Username')),
                      onFieldSubmitted: (text) async {
                        if(!_formsFilled()) {
                          return;
                        }
                        await _auth.register(_emailController.text, _usernameController.text, _passwordController.text);
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
                      if(!_formsFilled()) {
                        return;
                      }
                      await _auth.register(_emailController.text, _usernameController.text, _passwordController.text);
                    }
                )
              ),
              Container(
                  padding: buttonPadding,
                  child: TextFormField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(label: Text('Confirm password')),
                      obscureText: true,
                      onFieldSubmitted: (text) async {
                        if(!_formsFilled()) {
                          return;
                        }
                        await _auth.register(_emailController.text, _usernameController.text, _passwordController.text);
                      }
                  )
              ),
              Container(
                padding: buttonPadding,
                child: ElevatedButton(
                    child: const Text('Register'),
                    onPressed: () async {
                      if(!_formsFilled()) {
                        return;
                      }
                      await _auth.register(_emailController.text, _usernameController.text, _passwordController.text);
                    }
                )
              )
            ]
        )
    );
  }
}
