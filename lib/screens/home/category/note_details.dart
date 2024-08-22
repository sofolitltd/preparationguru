import 'package:flutter/material.dart';
import 'package:preparation_guru/screens/home/category/notes/note_details_view.dart';
import 'package:preparation_guru/utils/view_pdf.dart';
import 'package:preparation_guru/utils/view_video.dart';

class NoteDetails extends StatelessWidget {
  const NoteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for note details
    List<Map<String, String>> noteDetails = [
      {
        'title': 'Chapter 1: Introduction',
        'classNo': 'Class 1',
        'topic': 'Basics of Bangla Literature',
        'pdfUrl': "https://morth.nic.in/sites/default/files/dd12-13_0.pdf",
        'videoUrl': 'https://youtu.be/JbHX-Ahxvx8?si=RjhsMtbRLxqco3Fl',
      },
      {
        'title': 'Chapter 2: Grammar Rules',
        'classNo': 'Class 2',
        'topic': 'Bangla Grammar Overview',
        'pdfUrl': "https://morth.nic.in/sites/default/files/dd12-13_0.pdf",
        'videoUrl': 'https://youtu.be/h4H8gESupTA?si=-hAGiGrzmToaAG68',
      },
      {
        'title': 'Chapter 3: Advanced Topics',
        'classNo': 'Class 3',
        'topic': 'Complex Literature Forms',
        'pdfUrl': "https://morth.nic.in/sites/default/files/dd12-13_0.pdf",
        'videoUrl': 'https://youtu.be/h4H8gESupTA?si=-hAGiGrzmToaAG68',
      },
      {
        'title': 'Chapter 4: Summary',
        'classNo': 'Class 4',
        'topic': 'Summary of Lessons',
        'pdfUrl': "https://morth.nic.in/sites/default/files/dd12-13_0.pdf",
        'videoUrl': 'https://youtu.be/h4H8gESupTA?si=-hAGiGrzmToaAG68',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Details'),
        // backgroundColor: Colors.teal.shade100,
      ),
      body: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        itemCount: noteDetails.length,
        itemBuilder: (context, index) {
          //
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotesDetailsView(
                    title: noteDetails[index]['title']!,
                    videoUrl: noteDetails[index]['videoUrl']!,
                    pdfUrl: noteDetails[index]['videoUrl']!,
                  ),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 6,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      noteDetails[index]['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Class No. and Topic
                    Text(
                      noteDetails[index]['classNo']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      noteDetails[index]['topic']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Buttons and Download Icon Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // video
                        GestureDetector(
                          onTap: () {
                            //
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewVideo(
                                  title: noteDetails[index]['title']!,
                                  videoUrl: noteDetails[index]['videoUrl']!,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.deepOrange,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: const Text(
                              'Watch Video',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        //pdf
                        GestureDetector(
                          onTap: () {
                            //
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewPdf(
                                  title: noteDetails[index]['title']!,
                                  pdfUrl: noteDetails[index]['videoUrl']!,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.teal,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: const Text(
                              'View Pdf',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        //
                        const SizedBox(width: 10),

                        // Download PDF Icon Button
                        GestureDetector(
                          onTap: () {
                            //
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.blueAccent),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 4,
                            ),
                            child: const Icon(
                              Icons.download,
                              size: 20,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
