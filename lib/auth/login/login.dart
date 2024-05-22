import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/auth/register/register.dart';
import 'package:flutter_ui/home/home_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          "https://static.vecteezy.com/system/resources/previews/005/005/788/original/user-icon-in-trendy-flat-style-isolated-on-grey-background-user-symbol-for-your-web-site-design-logo-app-ui-illustration-eps10-free-vector.jpg",
          height: 200,
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
        RichText(
            text: TextSpan(
          text: "Belum Punya Akun?",
          style: const TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: ' Register',
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Aksi saat tautan diklik, misalnya navigasi ke halaman registrasi
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
            ),
          ],
        )),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(title: "Read List")),
            );
          },
          child: Text('Login'),
        ),
      ],
    );
  }
}
