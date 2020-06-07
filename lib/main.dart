import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:justhabbo_fm/splash/splash_screen.dart';
import 'package:justhabbo_fm/test_page.dart';
import 'splash/splash_screen.dart';

//class MyHttpOverrides extends HttpOverrides{
//  @override
//  HttpClient createHttpClient(SecurityContext context){
//    return super.createHttpClient(context)
//      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> false;
//  }
//}
//
//void main(){
//  HttpOverrides.global = new MyHttpOverrides();
//  runApp(new MyApp());
//}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}


Future<bool> addSelfSignedCertificate() async {
  ByteData data = await rootBundle.load('assets/raw/certificate.pem');
  SecurityContext context = SecurityContext.defaultContext;
  context.setTrustedCertificatesBytes(data.buffer.asUint8List());
  return true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  assert(await addSelfSignedCertificate());
  runApp(MyApp());
}





