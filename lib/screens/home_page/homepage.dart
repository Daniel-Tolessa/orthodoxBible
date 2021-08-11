import 'dart:math';

import 'widgets/home_widgets.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    setState(() {
      //TODO update continue reading section Homepage
    });
    return new MaterialApp(
      home: HomeView(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
    );
  }
}

class HomeView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text(""),
        elevation: 0.0,
        backgroundColor: Colors.grey[900],
        //uses BookSearch in the appBar
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: BookSearch());
            },
            icon: Icon(Icons.search),
          )
        ],
      ),


      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //banner
              Container(
                height: 200,
                child: banner(),
              ),
              SizedBox(
                height: 10,
              ),
              //TODO add if statement so it continueReading shows up if they are any books

              //continueReading -- only shows if there has been any recent books
              Kontinue_reading(),

              //OldTestament
              Row(
                children: [
                  Heading("Old Testaments"),
                  SizedBox(width: 50),
                  viewAll(jsonLocation: "json/oldbooks.json", type_title: "Old Testaments",)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              OldTestaments(),
              SizedBox(
                height: 40,
              ),

              //newTestaments
              Row(
                children: [
                  Heading("New Testaments"),
                  SizedBox(width: 55),
                  viewAll(jsonLocation: "json/newbooks.json", type_title: "New Testaments",)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              NewTestaments(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//TODO instead of making it a flat banner make it a swipeable
Widget banner() {
  //var randomGenerator = Random();
  //var number = randomGenerator.nextInt(4);

  return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          //image: AssetImage("assets/posters/poster" + number.toString() + ".jpg"),
          image: AssetImage("assets/posters/poster.png"),
          fit: BoxFit.fill,
        ),
      )
  );
}

class Heading extends StatelessWidget {
  final String title;
  Heading(this.title);
  @override
  Widget build(BuildContext context) {
    final TextStyle topMenuStyle = new TextStyle(fontFamily: 'Avenir next', fontSize: 25, color: Colors.white, fontWeight: FontWeight.w800, decoration: TextDecoration.none);
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("$title", style: topMenuStyle),
        ),
      ),
    );
  }
}




