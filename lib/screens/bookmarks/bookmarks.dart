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

    //TODO change it into reorderable and swipeable tile
    //TODO implement a swipeable tile that can delete when swiped
    //needs to have a notification asking to verify their choice

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
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


