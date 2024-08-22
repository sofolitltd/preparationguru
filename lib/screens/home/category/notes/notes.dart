import 'package:flutter/material.dart';
import 'package:preparation_guru/screens/home/category/note_details.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample notes data
    List<Map<String, dynamic>> notes = [
      {'no': 1, 'title': 'Bangla literature'},
      {'no': 2, 'title': 'English literature'},
      {'no': 3, 'title': 'Bangla grammar'},
      {'no': 4, 'title': 'English grammar'},
      {'no': 5, 'title': 'General math'},
      {'no': 6, 'title': 'Mental math'},
      {'no': 7, 'title': 'Science'},
      {'no': 8, 'title': 'Geography'},
      {'no': 9, 'title': 'Ethics'},
      {'no': 10, 'title': 'Bangladesh affairs'},
      {'no': 11, 'title': 'International affairs'},
      {'no': 12, 'title': 'Computer'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: notes.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          //
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              // leading: CircleAvatar(
              //   backgroundColor: Colors.teal,
              //   child: Text(
              //     notes[index]['no'].toString(),
              //     style: const TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              title: Text(
                notes[index]['title'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
              onTap: () {
                // Handle tap event here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoteDetails(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
