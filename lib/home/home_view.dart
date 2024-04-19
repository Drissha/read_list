import 'package:flutter/material.dart';
import 'package:flutter_ui/profile/profile_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _tabIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void changeTabIndex(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: drawer(context),
      body: IndexedStack(
        index: _tabIndex,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "How many book's you have read today:",
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          const Profile(), // Display Profile page at index 1
        ],
      ),
      floatingActionButton: FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNav(),
    );
  }

  BottomNavigationBar bottomNav() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      onTap: changeTabIndex,
      currentIndex: _tabIndex,
      elevation: 0,
      items: [
        _bottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: 'Beranda',
        ),
        _bottomNavigationBarItem(
          icon: const Icon(Icons.verified_user),
          label: 'Profile',
        )
      ],
    );
  }

  FloatingActionButton FAB() {
    return FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  Drawer drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Read List App')),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () {
              Navigator.of(context).pop(); // Close drawer
              changeTabIndex(
                  1); // Change tab index to navigate to the profile page
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      {required Widget icon, String? label}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
