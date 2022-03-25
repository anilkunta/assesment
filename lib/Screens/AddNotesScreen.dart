import 'file:///E:/Flutter%20Samples/assessment/lib/Screens/ListNotes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helper/SQLHelper.dart';

class AddNotesScreen extends StatelessWidget {
  /*final int index;
  InstallationView(this.index);
  var act;*/

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  static const String routeName = '/addnotes';
  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _titleController.text, _descriptionController.text);

  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, _titleController.text, _descriptionController.text);
  }
// Insert a new journal to the database


  // Update an existing journal


  // Delete an item

  @override
  Widget build(BuildContext context)
  {
    final routeArgs = ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, String>;
    String id2 = routeArgs['id'];
    int id;
    if(id2!="0")
      {
        id=int.parse(id2);
        print("aaaaaaaa"+id2);
        _titleController.text=  routeArgs['title']  ;
        _descriptionController.text=  routeArgs['desc']  ;
      }


    return

       Material(
           color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.only(left: 1,top: 50,right: 1),

              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                  TextField(
                    controller: _titleController,
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                        hintText: 'Title',
                     ),
                  ),

                      const SizedBox(
                        height: 10,
                      ),

                      TextField(
                        controller: _descriptionController,
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
                          hintText: 'Description',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // Save new journal
                          if (id == null) {
                            await _addItem();
                            Navigator.of(context)
                                .pushReplacementNamed(ListNotes.routeName, arguments: {
                            });
                          }

                          if (id != null) {
                            await _updateItem(id);
                            Navigator.of(context)
                                .pushReplacementNamed(ListNotes.routeName, arguments: {
                            });
                          }

                          // Clear the text fields
                          _titleController.text = '';
                          _descriptionController.text = '';

                          // Close the bottom sheet
                          //Navigator.of(context).pop();
                        },
                        child: Text(id == null ? 'Create New' : 'Update'),
                      )
                    ],
                  ),
                ),
        ),
              ),

          ),
      );

  }



  }
