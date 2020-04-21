import 'package:flutter/material.dart';
import 'package:flutter_radio/flutter_radio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justhabbo_fm/screens/about.dart';
import 'package:justhabbo_fm/widgets/bottomInfoBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String url = "http://server-23.stream-server.nl:8438";

  bool isPlaying = false;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    audioStart();
  }

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
    print('Audio Start OK');
  }

  FlatButton headerBtn({Function onPressed, String text}) {
    return FlatButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00BBDC),
      appBar: AppBar(
        backgroundColor: Color(0xFF414141),
        leading: Container(),
        actions: [
          headerBtn(
            text: 'Home',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          headerBtn(
            text: 'About',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => About()));
            },
          ),
          headerBtn(
            text: 'Version',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          headerBtn(
            text: 'Contact',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
//          Container(
//            color: Color(0xFF414141),
//            child: Row(
//              children: [
//                headerBtn(
//                  text: 'Home',
//                  onPressed: () {
//                    Navigator.push(context,
//                        MaterialPageRoute(builder: (context) => HomePage()));
//                  },
//                ),
//                headerBtn(
//                  text: 'About',
//                  onPressed: () {
//                    Navigator.push(context,
//                        MaterialPageRoute(builder: (context) => HomePage()));
//                  },
//                ),
//                headerBtn(
//                  text: 'Version',
//                  onPressed: () {
//                    Navigator.push(context,
//                        MaterialPageRoute(builder: (context) => HomePage()));
//                  },
//                ),
//                headerBtn(
//                  text: 'Contact',
//                  onPressed: () {
//                    Navigator.push(context,
//                        MaterialPageRoute(builder: (context) => HomePage()));
//                  },
//                ),
//              ],
//            ),
//          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .4,
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/paris.png'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'JustHabbo',

                          textAlign: TextAlign.center,
                          style: GoogleFonts.passionOne(
                              textStyle: TextStyle(
                                  shadows: [
                                    Shadow(
                                      color: Colors.blue.shade900.withOpacity(1.0),
                                      offset: Offset(5.0, 5.0),
                                      blurRadius: 4.0,
                                    ),
                                  ],
                                  fontSize: 50,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(right: 50),
                  alignment: Alignment.center,
                  color: Color(0xFF00BBDC),
                  child: new Column(
                    children: <Widget>[
                      IconButton(
                        icon: isPlaying
                            ? Icon(
                          Icons.pause_circle_outline,
                          size: 90,
                          color: Colors.white,
                        )
                            : Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 90,
                        ),
                        onPressed: () {
                          setState(() {
                            FlutterRadio.play(url: url);
                            isPlaying = !isPlaying;
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomInfoBar(),
    );
  }
}
