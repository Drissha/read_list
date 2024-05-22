import 'package:flutter/material.dart';
import 'package:flutter_ui/add/add_list.dart';
import 'package:flutter_ui/detail/detail_view.dart';
import 'package:flutter_ui/profile/profile_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;

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
        children: const [
          homeView(),
          Profile(), // Display Profile page at index 1
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
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add Book'),
                content: Text('Add your Read list'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddListView()),
                      );
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            });
      },
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
              Navigator.of(context).pop();
              changeTabIndex(1);
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

final List<Map<String, String>> dataList = [
  {
    'name': 'Farm House Lembang',
    'location': 'Lembang',
    'imageURL':
        'https://akcdn.detik.net.id/community/media/visual/2021/06/13/farm-house-susu-lembang-1_169.jpeg'
  },
  {
    'name': 'Observatorium Bosscha',
    'location': 'Lembang',
    'imageURL':
        'https://upload.wikimedia.org/wikipedia/commons/7/7f/Bosscha_001.JPG'
  },
  {
    'name': 'Stone Garden',
    'location': 'Padalarang',
    'imageURL':
        'https://o-cdn-cas.sirclocdn.com/parenting/images/Stone-Garden-Bandung-travelspromo.width-800.format-webp.webp'
  },
  {
    'name': 'Taman Film Pasopati',
    'location': 'Kota Bandung',
    'imageURL':
        'https://o-cdn-cas.sirclocdn.com/parenting/images/Tiket_Masuk_TFB.width-800.format-webp.webp'
  },
  {
    'name': 'Museum Geologi',
    'location': 'Kota Bandung',
    'imageURL':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Bandung%2C_Museum_Geologi.jpg/1200px-Bandung%2C_Museum_Geologi.jpg'
  },
];

class homeView extends StatelessWidget {
  const homeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, constraints) {
      if (constraints.maxWidth < 700) {
        return SafeArea(child: _mobileView());
      } else if (constraints.maxWidth < 1366) {
        return SafeArea(child: _tabletView());
      } else {
        return SafeArea(child: _laptopView());
      }
    });
  }
}

Widget _mobileView() {
  return ListView.builder(
    itemCount: dataList.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) =>
                //           DetailView(itemData: dataList[index])),
                // );
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid)),
                child: Row(
                  children: [
                    Flexible(
                      child: Image.network(
                        dataList[index]['imageURL']!,
                        width: 200,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(dataList[index]['name']!),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(dataList[index]['location']!),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              IconButton.outlined(
                                  onPressed: () => print("added"),
                                  icon: const Icon(Icons.add_outlined)),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton.filled(
                                  onPressed: () => print("shared"),
                                  icon: const Icon(Icons.share)),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    },
  );
}

Widget _tabletView() {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 2 / 3,
      crossAxisCount: 4,
    ),
    itemCount: dataList.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //           DetailView(itemData: dataList[index])),
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Image.network(
                          dataList[index]['imageURL']!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(dataList[index]['name']!),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(dataList[index]['location']!),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                IconButton.outlined(
                                  onPressed: () => print("added"),
                                  icon: const Icon(Icons.add_outlined),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                IconButton.filled(
                                  onPressed: () => print("shared"),
                                  icon: const Icon(Icons.share),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _laptopView() {
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 3, crossAxisCount: 6),
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    //           DetailView(itemData: dataList[index])),
                    // );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid)),
                    child: Column(
                      children: [
                        Flexible(
                          child: Image.network(
                            dataList[index]['imageURL']!,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dataList[index]['name']!),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(dataList[index]['location']!),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  IconButton.outlined(
                                    onPressed: () => print("added"),
                                    icon: const Icon(Icons.add_outlined),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  IconButton.filled(
                                    onPressed: () => print("shared"),
                                    icon: const Icon(Icons.share),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
