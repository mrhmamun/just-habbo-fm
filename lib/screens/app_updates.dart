import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justhabbo_fm/home/home_page.dart';
import 'package:justhabbo_fm/widgets/bottomInfoBar.dart';

class AppUpdates extends StatefulWidget {
  @override
  _AppUpdatesState createState() => _AppUpdatesState();
}

class _AppUpdatesState extends State<AppUpdates> {
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
          "App Updates",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'App Version: 1.0',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text('Designed By: Harry Pattinsion',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Coded By: mrhmamun99',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Update Date: Wednesday 15th April 2020',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Text('Update Features:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                SizedBox(
                  height: 10,
                ),
                Text('-New IOS Design more Sleek & Modern.',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                SizedBox(height: 10,),
                Text('Download Updates:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
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
