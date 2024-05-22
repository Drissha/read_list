import 'package:flutter/material.dart';
import 'package:flutter_ui/auth/login/login.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: RegisterForm(),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Register",
          style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Username',
          ),
        ),
        const SizedBox(height: 20.0),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
          ),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: const Text('Register'),
        ),
      ],
    );
  }
}
