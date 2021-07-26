import 'package:flutter/material.dart';

void main() => runApp(Bible());

class Bible extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    return MaterialApp(
      title: "Bible",
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.lightBlue,
      ),
      home: bottomTabBar(),
    );
  }
}

class bottomTabBar extends StatefulWidget {
  //final TextStyle buttonFont = new TextStyle(fontFamily: "Avenir next", fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);
  @override
  _bottomTabBarState createState() => _bottomTabBarState();
}

class _bottomTabBarState extends State<bottomTabBar> {
  //var initialIndex = 0;
  int _selectedIndex = 0;

  TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    //_tabController = TabController(length: 4, vsync: this);
  }
  int _bottomNavIndex = 0;
  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      HomePage(),
      Bookmark(),
      Notes(),
      MoreDetails(),
    ];
    return Scaffold(
      //_pages.elementAt(_selectedIndex),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: "Bookmarks"),
          BottomNavigationBarItem(icon: Icon(Icons.notes_sharp), label: "Notes"),
          BottomNavigationBarItem(icon: Icon(Icons.info_sharp), label: "More"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapped,
      ),
    );
  }
}
