
import 'package:flutter/material.dart';

import '../Screens/AddNotesScreen.dart';

class ListViewWidget extends StatelessWidget
{
  int index;
  List<Map<String, dynamic>> _Note;
  ListViewWidget(this.index,this._Note);


  Widget build(BuildContext context)
  {
    return  Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/background.png"),
                               fit: BoxFit.cover)
      ),
      child: Card(

          color: Colors.white,
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          elevation: 8,
          //margin: EdgeInsets.all(10),
          child:Column
            (
            children: [
              Container(
                margin: EdgeInsets.all(8),
                //height: 30,
                child: Row(
                  children: [
                    Text( "Title                         :     ",style: TextStyle(fontSize: 23,fontWeight: FontWeight.normal),),
                    Flexible(
                      child: Text(_Note[index]['title'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                            ),
                            iconSize: 40,
                            color: Colors.green,
                            splashColor: Colors.purple,
                            onPressed: () {
                              print(_Note[index]['id']);

                              Navigator.of(context)
                                  .pushReplacementNamed(AddNotesScreen.routeName, arguments: {
                                'id': _Note[index]['id'].toString(),
                                'title':_Note[index]['title'].toString(),
                                'desc':_Note[index]['description'].toString()
                              });
                            },
                          ),
                        )
                    ),
                  ],
                ),

              ),
              Container(
                margin: EdgeInsets.all(8),
                //height: 30,
                child: Row(
                  children: [
                    Text( "Description             :     ",style: TextStyle(fontSize: 23,fontWeight: FontWeight.normal),),
                    Expanded(
                      child: Text(_Note[index]['description'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),

              ),
              Container(
                margin: EdgeInsets.all(8),
                //height: 30,
                child: Row(
                  children: [
                    Text( "CreatedAt               :     ",style: TextStyle(fontSize: 23,fontWeight: FontWeight.normal),),
                    Expanded(
                      child: Text(_Note[index]['createdAt'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold) ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.all(8),
                //height: 30,
                child: Row(
                  children: [
                    Text( "UpdatedAt              :     ",style: TextStyle(fontSize: 23,fontWeight: FontWeight.normal)),
                    Expanded(
                      child: Text(_Note[index]['updatedAt'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),

              ),
            ],
          )
      ),
    );
  }
}