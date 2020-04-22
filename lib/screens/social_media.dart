import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justhabbo_fm/home/home_page.dart';
import 'package:justhabbo_fm/widgets/bottomInfoBar.dart';

class SocialMedia extends StatefulWidget {
  @override
  _SocialMediaState createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00BBDC),
      appBar: AppBar(
        backgroundColor: Color(0xFF414141),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
        ],
        title: Text(
          "Social Media",
          style: GoogleFonts.lobster(
              textStyle: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Bellow are our social media platforms for you to get involved in.',textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      child: GestureDetector(
                        onTap: null,
                        child: Image.asset('assets/images/android.png'),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 70,
                      child: GestureDetector(
                        onTap: null,
                        child: Image.asset('assets/images/apple.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomInfoBar(),
    );
  }
}
