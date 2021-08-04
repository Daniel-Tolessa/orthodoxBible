import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

/// Holds the text when one of the chapter's is selected
class TextScreen extends StatefulWidget {

  final String textLocation;
  TextScreen({required this.textLocation});
  @override
  _TextScreenState createState() => _TextScreenState(textLocation);
}

class _TextScreenState extends State<TextScreen> {

  String textLocation;
  _TextScreenState(this.textLocation);
  String data = "";

  /*
     Helper method that
       Gets the corresponding text for the given chapter -- from txt file
   */
  fetchText() async {
    String text;

    text = await rootBundle.loadString(textLocation);

    setState(() {
      data = text;
    });
  }

  @override
  void initState() {
    fetchText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF262b2d),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
              child: Center(
                child: SelectableText(
                  data,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              //TODO replace manual numbers to fit any screen
                // using mediaQuery
              top: height - 100,
              right: width - 90,
              width: 70,
              child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  onPressed: () {},
                  child: Column(
                    children: [
                      Icon(Icons.arrow_back),
                      Text("Previous", style: TextStyle(color: Colors.redAccent)),
                    ],
                  )
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {},
            child: Column(
              children: [
                Icon(Icons.forward, size: 40,),
                Text("Next", style: TextStyle(color: Colors.white)),
              ],
            )
        ),
      ),
    );
  }
}