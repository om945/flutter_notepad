import 'package:flutter/material.dart';
import 'package:flutter_notepad/Pages/note_card.dart';
import 'package:flutter_notepad/models.dart/note.dart';
import 'package:flutter_notepad/utils/add_notes.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        shape: Border(bottom: BorderSide(color: Colors.white, width: 0.1)),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Notepad',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteCard(
            note: notes[index],
            index: index,
            onNoteDeleted: onNoteDeleted,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  AddNotes(onNewNoteCreated: onNewNoteCreated)));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  void onNewNoteCreated(Note note) {
    notes.add(note);
    setState(() {});
  }

  void onNoteDeleted(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}
