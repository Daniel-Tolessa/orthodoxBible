import 'home_widgets.dart';

class viewAll extends StatelessWidget {
  final String jsonLocation;
  final String type_title;
  viewAll({required this.jsonLocation, required this.type_title});
  @override
  Widget build(BuildContext context) {
    //TODO implement see more button that it can always be at the same place
    final btn_width = MediaQuery.of(context).size.width;
    return Container(
      child: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
          //minWidth: btn_width,
          child: Text(
            "See more",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GridViewScreen(jsonLocation: this.jsonLocation, type_title: this.type_title))
            );
          },
        ),
      ),
    );
  }
}