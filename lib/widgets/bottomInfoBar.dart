import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Stack bottomInfoBar(){
  return Stack(
    children: [
      Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/bottomimage1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned.fill(
        bottom: 0.0,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            'Copyright: JustHabbo.com, all rights reserved 2020',
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    ],
  );
}