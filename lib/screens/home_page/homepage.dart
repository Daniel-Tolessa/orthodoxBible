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
      //themeMode: ThemeMode.dark,
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
        backgroundColor: Colors.blueGrey,
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
              //TODO add if statement so it only shows up if they are any books
              Row(
                children: [
                  Heading("Continue Reading"),
                  SizedBox(width: 60,),
                  Text(
                    "Filter by",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),

                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list_outlined, color: Colors.white,),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Kontinue_reading(),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Heading("Old Testaments"),
                  SizedBox(width: 50),
                  viewAll(jsonLocation: "json/bookjson.json", type_title: "Old Testaments",)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              OldTestaments(),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Heading("New Testaments"),
                  SizedBox(width: 55),
                  viewAll(jsonLocation: "json/newTestamentJson.json", type_title: "New Testaments",)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              NewTestaments(),
              // SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}


Widget banner() {
  var randomGenerator = Random();
  var number = randomGenerator.nextInt(4);

  return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/poster" + number.toString() + ".jpg"),
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




