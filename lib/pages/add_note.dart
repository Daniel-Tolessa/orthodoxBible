import 'package:flutter/material.dart';

class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
  final String edited_text;
  final String edited_description;
  AddNotePage({required this.edited_text, required this.edited_description});
}

class _AddNotePageState extends State<AddNotePage> {
  final NoteDatabase notedatabase = new NoteDatabase();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String title;
  String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.save, color: Colors.redAccent,),
        //     //TODO saves the given note
        //     onPressed: () {},
        //   )
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter title",
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
              maxLength: 20,
            ),
            Expanded(
              child: TextField(
                controller: descriptionController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Enter description",
                  border: InputBorder.none,
                ),

              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            title = titleController.text;
            description = descriptionController.text;
          });
          Note newnote = Note(title: title, description: description);
          notedatabase.addNote(newnote);
        },
        backgroundColor: Colors.black,
        label: Text("Save Note"),
        icon: Icon(Icons.save),
      ),
    );
  }
}