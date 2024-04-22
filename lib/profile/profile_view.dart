import 'package:flutter/material.dart';
import 'package:flutter_ui/profile/profile_view.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile'),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Buku'),
            ),
          ],
        ),
      ),
    );
  }
}
