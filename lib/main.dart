import 'file:///E:/Flutter%20Samples/assessment/lib/Screens/AddNotesScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/ListNotes.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,

        title: 'Notes',
        theme: ThemeData(
         // primarySwatch: Colors.orange,
          primaryColor:Colors.white,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            subtitle: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.normal,
            ),
              title: TextStyle(
                fontSize: 25,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )),
        ),
        initialRoute: '/', // default is '/'
        routes: {
          '/': (ctx) => ListNotes(),
          AddNotesScreen.routeName: (ctx) =>
              AddNotesScreen(),
        },
        //home: const ListNotes()
    );
  }
}


