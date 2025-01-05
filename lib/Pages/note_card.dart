import 'package:flutter/material.dart';
import 'package:flutter_notepad/Pages/note_view.dart';
import 'package:flutter_notepad/models.dart/note.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteCard extends StatelessWidget {
  const NoteCard(
      {super.key,
      required this.note,
      required this.index,
      required this.onNoteDeleted});

  final Note note;
  final int index;

  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteView(
                  note: note,
                  index: index,
                  onNoteDeleted: onNoteDeleted,
                )));
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            note.title,
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
            note.body,
            style: TextStyle(
              fontStyle: GoogleFonts.poppins().fontStyle,
              fontSize: 25,
            ),
            maxLines: 10000,
            overflow: TextOverflow.ellipsis,
          )
        ]),
      )),
    );
  }
}
