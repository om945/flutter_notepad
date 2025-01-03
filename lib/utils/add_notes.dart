import 'dart:ui';
import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          'Add Notes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: titleController,
              style: TextStyle(fontSize: 30),
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: noteController,
              selectionHeightStyle: BoxHeightStyle.max,
              decoration:
                  InputDecoration(labelText: 'Note', border: InputBorder.none),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
      ),
    );
  }
}
