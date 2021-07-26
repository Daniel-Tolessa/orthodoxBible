import 'package:flutter/material.dart';

class Bookmark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: bookmarkview(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class bookmarkview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //TODO change it into reorderable list view
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("My BookMarks"),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF262b2d),
      body: ListView(
        children: List.generate(50, (index) => ListTile(
          title: Text("Note $index ", style: TextStyle(color: Colors.white),),
          leading: Icon(Icons.shuffle, color: Colors.white,),
        )),
      ),
    );
  }
}


