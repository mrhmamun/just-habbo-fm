import 'dart:io';
import 'package:device_simulator/device_simulator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:justhabbo_fm/splash/splash_screen.dart';
import 'splash/splash_screen.dart';

//const bool debugEnableDeviceSimulator = true;

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
//  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  WidgetsFlutterBinding.ensureInitialized();
  assert(await addSelfSignedCertificate());
  runApp(
    MyApp(),
  );
}

//void main() => runApp(
//  DevicePreview(
//    enabled: !kReleaseMode,
//    builder: (context) => MyApp(),
//  ),
//);
