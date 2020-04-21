import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justhabbo_fm/widgets/bottomInfoBar.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final String text =
      "JustHabbo Is an International unofficial fanssite for the world of Habbo providing 24/7 radio, events, discussions, competitions and More.";
  final String text2 =
      """JustHabbo was started back In 2012 by Richard, Andrew and Rue however due to unforeseen circumstances they had to close the Site. JustHabbo was taken over with Grant and Harry as the new ownership, over the past couple years we have had multiple different Owners however Hany Is still here awning this incredible famine.\n 
JustHabbo has had a rough time since the original launch in 2012 however we have come though the rocky waters stronger than ever, JustHabbo has seen past versions from Version one though too Version 4.\nThe Launch of V5 is around the corner and we hope you stick around to see It. 
We developed this app to enhance our users experience allowing people to tune Into JustHabbo, and to never miss any Information whilst they are on the go.\n 
JustHabbo has some exciting plans to develop and enhance the app, so be sure to stay tuned for any future updates 
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00BBDC),
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        title: Text(
          "About JustHabbo",
          style: GoogleFonts.lobster(
              textStyle: TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                text2,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomInfoBar(),
    );
  }
}
