import 'package:flutter/material.dart';

import 'home/home_page.dart';

class TabBar20 extends StatefulWidget {
  @override
  _TabBar20State createState() => _TabBar20State();
}

class _TabBar20State extends State<TabBar20> {
  @override
  Widget build(BuildContext context) {
    return TabBarChild20();
  }
}

class TabBarChild20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Color(0xFF00BBDC),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Container(
                child: SafeArea(
                    child: Column(
                  children: [
                    Material(
                      color: Color(0xFF414141),
                      child: TabBar(
                          unselectedLabelColor: Colors.white,
//                        indicator: BoxDecoration(
//                          gradient: LinearGradient(colors:[Colors.redAccent,Colors.orange],),
////                          borderRadius:BorderRadius.circular(50),
////                          color: Colors.redAccent,
//                        ),
                          indicatorColor: Colors.transparent,
                          tabs: [
                            Tab(
                              child: Text("Home"),
                            ),
                            Tab(
                              child: Text("About"),
                            ),
                            Tab(
                              child: Text("Update"),
                            ),
                            Tab(
                              child: Text("Contact"),
                            ),
                          ]),
                    )
                  ],
                )),
              ),
            ),
            body: TabBarView(children: [
              HomePage(),
              Icon(Icons.movie, size: 200.0),
              Icon(Icons.games, size: 200.0),
              Icon(Icons.games, size: 200.0),
            ]),
          )),
    );
  }
}
