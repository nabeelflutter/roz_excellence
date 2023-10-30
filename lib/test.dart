import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Array in ListView'),
        ),
        body: FirebaseArrayListViewWidget(),
      ),
    );
  }
}

class FirebaseArrayListViewWidget extends StatefulWidget {
  @override
  _FirebaseArrayListViewWidgetState createState() => _FirebaseArrayListViewWidgetState();
}

class _FirebaseArrayListViewWidgetState extends State<FirebaseArrayListViewWidget> {
  List<dynamic> itemList = [];

  @override
  void initState() {
    super.initState();
    _getArrayItems();
  }

  Future<void> _getArrayItems() async {
    try {
      // Replace 'items' with your Firestore collection name and 'your_document_id' with the specific document ID.
      DocumentSnapshot document = await FirebaseFirestore.instance.collection('items').doc('your_document_id').get();

      // Access the 'item' field.
      itemList = List.from(document['item']);

      // Update the state to trigger a re-build of the widget with the updated array.
      setState(() {});
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(itemList[index].toString()),
        );
      },
    );
  }
}