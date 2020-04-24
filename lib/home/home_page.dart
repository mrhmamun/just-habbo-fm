
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:justhabbo_fm/screens/about.dart';
import 'package:justhabbo_fm/screens/app_updates.dart';
import 'package:justhabbo_fm/screens/more.dart';
import 'package:justhabbo_fm/widgets/bottomInfoBar.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AudioPlayer _player;
  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    _player.setUrl(
        "http://server-23.stream-server.nl:8438/")
        .catchError((error) {
      // catch audio error ex: 404 url, wrong url ...
      print(error);
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }


  //to skip ssl certificate
  //https://stackoverflow.com/questions/54104685/flutter-add-self-signed-certificate-from-asset-folder

//
//  Future<ByteData> getFileData(String path) async {
//    return await rootBundle.load(path);
//  }
//
//  void initializeHttpClient() async {
//    try {
//      ByteData data = await rootBundle.load('assets/raw/certificate.crt');
//      SecurityContext context = SecurityContext.defaultContext;
//      context.setTrustedCertificatesBytes(data.buffer.asUint8List());
//      var client = HttpClient(context: context);
//    } on Exception catch (exception) {
//      print(exception.toString());
//    }
//  }

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
            onPressed: null,
          ),
          headerBtn(
            text: 'About',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => About()));
            },
          ),
          headerBtn(
            text: 'Version',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AppUpdates()));
            },
          ),
          headerBtn(
            text: 'More',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => More()));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
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
                StreamBuilder<FullAudioPlaybackState>(
                  stream: _player.fullPlaybackStateStream,
                  builder: (context, snapshot) {
                    final fullState = snapshot.data;
                    final state = fullState?.state;
                    final buffering = fullState?.buffering;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (state == AudioPlaybackState.connecting ||
                            buffering == true)
                          Container(
                            margin: EdgeInsets.all(8.0),
                            width: 64.0,
                            height: 64.0,
                            child: CircularProgressIndicator(),
                          )
                        else if (state == AudioPlaybackState.playing)
                          IconButton(
                            icon: Icon(Icons.pause_circle_outline,color: Colors.white,),
                            iconSize: 80.0,
                            onPressed: _player.pause,
                          )
                        else
                          IconButton(
                            icon: Icon(Icons.play_circle_filled,color: Colors.white,),
                            iconSize: 80.0,
                            onPressed: _player.play,
                          ),
                      ],
                    );
                  },
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
