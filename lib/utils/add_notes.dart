import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_notepad/models.dart/note.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key, required this.onNewNoteCreated});

  final Function(Note) onNewNoteCreated;

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
                labelStyle: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              scrollPhysics: BouncingScrollPhysics(),
              controller: noteController,
              style: TextStyle(fontSize: 25),
              selectionHeightStyle: BoxHeightStyle.max,
              decoration: InputDecoration(
                  hintText: 'Note',
                  hintStyle: TextStyle(fontSize: 23),
                  border: InputBorder.none),
              maxLines: 100,
              minLines: 1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty && noteController.text.isEmpty) {
            return;
          }
          final note =
              Note(title: titleController.text, note: noteController.text);
          widget.onNewNoteCreated(note);
          Navigator.of(context).pop();
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
