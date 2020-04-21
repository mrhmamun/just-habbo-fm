import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_radio/flutter_radio.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//          appBar: new AppBar(
//            title: const Text('IndieXL Online Radio'),
//            backgroundColor: Colors.blueGrey.shade900,
//            centerTitle: true,
//          ),
      body: Container(
        color: Color(0xFF00BBDC),
        child: new Column(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Icon(
                Icons.radio, size: 250,
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Align(
                  alignment: FractionalOffset.center,
                  child: IconButton(icon: isPlaying? Icon(
                    Icons.pause_circle_outline,
                    size: 80,
                    color: Colors.white,
                  )
                      : Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 80,
                  ),
                    onPressed: (){
                      setState(() {
                        FlutterRadio.play(url: url);
                        isPlaying = !isPlaying;
                        isVisible = !isVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}