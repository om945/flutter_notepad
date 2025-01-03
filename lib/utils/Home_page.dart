import 'package:flutter/material.dart';
import 'package:flutter_notepad/models.dart/note.dart';
import 'package:flutter_notepad/utils/add_notes.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Notepad',
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'currently Empty',
          style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddNotes()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  void OnNewNoteCreated(Note note) {
    notes.add(note);
    setState(() {});
  }

  void OnNoteDeleted(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}
