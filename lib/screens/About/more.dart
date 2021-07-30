import 'widgets/widgets_export.dart';

class MoreDetails extends StatefulWidget {
  @override
  _MoreDetailsState createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {

  static String terms = """
Terms & Conditions
By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, database rights and other intellectual property rights related to it, still belong to Daniel Tolessa.
Daniel Tolessa is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.
The Demo App app stores and processes personal data that you have provided to us, in order to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the Demo App app won’t work properly or at all.
The app does use third party services that declare their own Terms and Conditions.
Link to Terms and Conditions of third party service providers used by the app
Google Play Services
You should be aware that there are certain things that Daniel Tolessa will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but Daniel Tolessa cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.
If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.
Along the same lines, Daniel Tolessa cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, Daniel Tolessa cannot accept responsibility.
With respect to Daniel Tolessa’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. Daniel Tolessa accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.
At some point, we may wish to update the app. The app is currently available on Android & iOS – the requirements for both systems(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. Daniel Tolessa does not promise that it will always update the app so that it is relevant to you and/or works with the Android & iOS version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.
Changes to This Terms and Conditions

I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page.

These terms and conditions are effective as of 2021-06-01

Contact Us

If you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact me at bosoqahagelo7@gmail.com.
  """;

  static String about_us = """
I firmly believe that a bible app should be free of ads and free to purchase. Thus I have decided not to include any sort of ad. I was motivated to build the app after noticing a lack of orthodox bible app in the app store. More functionalities will be included in new releases. For the search functionality, I intentionally left the functionality to search by
I'm no expert but wanted to use my skill to my best to create
  """;

  static String about = """
This is the English Orthodox Bible as it has been translated in "The Orthodox Study Bible". It is important to mention that this translation belong to the Orthodox Church, the one which has Mount Athos, Greece, Russia Romania, etc. It is also known as the Eastern Christianity. 
It is also important to notice that, in opposition with other confessions, the Orthodox faith states that the Holy Scripture is not the book in which you can find everything, all the guidance and all the faith. Along with the Bible, the Orthodox Church has the Holy Tradition, which is also essential in providing a proper guidance. There were people who became saints, even if they haven't read the Bible, such as Elijah, Abraham, and others. Thus, it is important to search for further guidance from the Holy Fathers and to be part of the Orthodox church, part from a community, to have friends and fellow Christians who can help you in your quest, 
  """;

  fetchTermsAndConditions() async {
    String text;
    text = await rootBundle.loadString("texts/terms.txt");
    setState(() {
      terms = text;
    });
  }



  List<Details> items = <Details> [
    Details(header: "About the Bible", body: about),
    Details(header: "About me", body: about_us),
    Details(header: "Terms and conditions", body: terms),
    Details(header: "Picture credits", body: terms),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text("About")),
      ),
      backgroundColor: Color(0xFF262b2d),
      body: ListView(
        children: [
          //SizedBox(height: 430,),
//          Padding(
//              padding: EdgeInsets.only(left: 20),
//              child: Text("Info", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),)
//          ),
          //Divider(thickness: 2, height: 2, color: Colors.white,),
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: ExpansionPanelList(
                children: items.map<ExpansionPanel>((Details item) {
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isOpen) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Container(
                          child: Text(item.header,
                            style: TextStyle(fontSize: 18,),),
                        ),
                      );
                    },
                    isExpanded: item.isOpen,
                    body: ListTile(
                      tileColor: Colors.white,
                      title: Text(item.body, style: TextStyle(color: Colors.black,)),
                    ),

                  );
                }).toList(),
                expansionCallback: (index, isOpen) {
                  setState(() {
                    items[index].isOpen = !items[index].isOpen;
                  });
                }
            ),
          )
        ],
      ),
    );
  }
}

class Details {
  final String header;
  final String body;
  bool isOpen;

  Details({required this.header, required this.body, this.isOpen = false});
}


