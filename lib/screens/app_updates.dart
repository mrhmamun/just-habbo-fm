import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justhabbo_fm/home/home_page.dart';
import 'package:justhabbo_fm/widgets/bottomInfoBar.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUpdates extends StatefulWidget {
  @override
  _AppUpdatesState createState() => _AppUpdatesState();
}

class _AppUpdatesState extends State<AppUpdates> {
  _launchPlayStore() async {
    const url = 'https://play.google.com/store/search?q=just%20habbo&c=apps';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchAppleStore() async {
    const url = 'https://appstoreconnect.apple.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _getStoreUpdates() {
    if (Platform.isIOS) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            child: GestureDetector(
              onTap: () {
                _launchAppleStore();
              },
              child: Icon(
                FontAwesomeIcons.apple,
                size: 55,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            child: GestureDetector(
              onTap: () {
                _launchPlayStore();
              },
              child: Icon(
                Icons.android,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Container(
            height: 80,
            child: GestureDetector(
              onTap: () {
                _launchAppleStore();
              },
              child: Icon(
                FontAwesomeIcons.apple,
                size: 55,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00BBDC),
      appBar: AppBar(
        backgroundColor: Color(0xFF414141),
        centerTitle: true,
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
                Text('Designed By: Harry Pattinson',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Coded By: mrhmamun99',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Update Date: Wednesday 9th June 2020',
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
                SizedBox(
                  height: 10,
                ),
                Text('Download Updates:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                SizedBox(
                  height: 10,
                ),
                _getStoreUpdates(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomInfoBar(),
    );
  }
}
