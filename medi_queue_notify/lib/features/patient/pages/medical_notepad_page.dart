import 'package:flutter/material.dart';
import 'package:medi_queue_notify/features/patient/widgets/medical_note_tile.dart';
import 'package:medi_queue_notify/core/utils/lists.dart';

class MedicalNotepad extends StatefulWidget {
  const MedicalNotepad({super.key});

  @override
  State<MedicalNotepad> createState() => _MedicalNotepadState();
}

class _MedicalNotepadState extends State<MedicalNotepad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Medical Notepad",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: Lists.medicalNotes
                    .map(
                      (mn) => MedicalNoteTile(
                        dateTime: mn.dateTime,
                        description: mn.description,
                        title: mn.title,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
