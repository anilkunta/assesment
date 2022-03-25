import 'file:///E:/Flutter%20Samples/assessment/lib/Screens/AddNotesScreen.dart';

import '../Helper/SQLHelper.dart';
import 'package:flutter/material.dart';

import '../Widgets/ListViewWidget.dart';
class ListNotes extends StatefulWidget
{
  static const String routeName = '/';
  @override
  _ListNotesState createState() => _ListNotesState();
}

class _ListNotesState extends State<ListNotes>
{
  final TextEditingController _descriptionController = TextEditingController();
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted Note!'),
    ));
    _refreshJournals();
  }
  List<Map<String, dynamic>> _Notes = [];
  bool _isLoading = true;
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _Notes = data;
      _isLoading = false;
    });
  }
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("Search",style: TextStyle(fontSize: 23,fontWeight: FontWeight.normal),),
      onPressed: () async {
        final data = await SQLHelper.getItem(_descriptionController.text);
        setState(() {
          _Notes = data;
          _isLoading = false;



          Navigator.pop(context, false);
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Search with title"),
      content: TextField(
        controller: _descriptionController,
        decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.teal)),
          hintText: 'title',
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        actions: [
          MaterialButton(
          shape: const CircleBorder(),
      color: Colors.lightBlue,

      //padding: const EdgeInsets.all(20),
      onPressed: () {
        showAlertDialog(context);
      },

      child: const Icon(
        Icons.search,
        size: 50,
        color: Colors.white,
      ),
    ),
          MaterialButton(
            shape: const CircleBorder(),
            color: Colors.lightBlue,

            //padding: const EdgeInsets.all(20),
      onPressed: () {
        Navigator.of(context)
            .pushReplacementNamed(AddNotesScreen.routeName, arguments: {
          'id': "0",
          'title':"",
          'desc':""
        });
      },

            child: const Icon(
              Icons.add,
              size: 50,
              color: Colors.white,
            ),
          ),
          MaterialButton(
            shape: const CircleBorder(),
            color: Colors.lightBlue,

            //padding: const EdgeInsets.all(20),
            onPressed: () {
              _refreshJournals();
            },

            child: const Icon(
              Icons.refresh,
              size: 50,
              color: Colors.white,
            ),
          ),


        ],

        title: const Text('NotesEveryday'),
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Container(
         height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
    image: DecorationImage(image: AssetImage("assets/images/background.png"),
    fit: BoxFit.cover)
       ),
            child: ListView.builder(
        itemCount: _Notes.length,
        itemBuilder: (context, index) =>


             ListViewWidget(index,_Notes),

      ),
          ),

    );
  }
}