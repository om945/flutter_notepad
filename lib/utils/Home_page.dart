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
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                notes[index].title,
                style: TextStyle(
                  fontStyle: GoogleFonts.poppins().fontStyle,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                notes[index].note,
                style: TextStyle(
                  fontStyle: GoogleFonts.poppins().fontStyle,
                  fontSize: 25,
                ),
                maxLines: 10000,
                overflow: TextOverflow.ellipsis,
              )
            ]),
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  AddNotes(onNewNoteCreated: OnNewNoteCreated)));
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
