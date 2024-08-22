import 'package:flutter/material.dart';
import 'package:preparation_guru/utils/view_pdf.dart';

import '../../utils/url_luncher.dart';

class Job {
  String title;
  String company;
  String logo;
  String circularPdf;
  String circularUrl;

  Job({
    required this.title,
    required this.company,
    required this.logo,
    required this.circularPdf,
    required this.circularUrl,
  });
}

List<Job> jobs = [
  Job(
    title: "Software Engineer",
    company: "Google",
    logo:
        "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png",
    circularPdf: "https://example.com/google_job_circular.pdf",
    circularUrl: "https://careers.google.com/",
  ),
  Job(
    title: "Data Scientist",
    company: "Amazon",
    logo:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/2560px-Amazon_logo.svg.png",
    circularPdf: "https://example.com/amazon_job_circular.pdf",
    circularUrl: "https://www.amazon.jobs/en/",
  ),
  Job(
    title: "Product Designer",
    company: "Apple",
    logo:
        "https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png?202209270857",
    circularPdf: "https://example.com/apple_job_circular.pdf",
    circularUrl: "https://www.apple.com/jobs/us/",
  ),
];

class JobCircular extends StatefulWidget {
  const JobCircular({super.key});

  @override
  State<JobCircular> createState() => _JobCircularState();
}

class _JobCircularState extends State<JobCircular> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Circulars"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: jobs.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return _buildJobItem(jobs[index]);
        },
      ),
    );
  }

  Widget _buildJobItem(Job job) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Logo (if available)
              if (job.logo != '')
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black12,
                    image: DecorationImage(
                      image: NetworkImage(
                        job.logo,
                      ),
                    ),
                  ),
                ),

              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    Text(
                      job.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Text(
                      job.company,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    //
                    Text(
                      job.circularUrl,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 12),

                    //
                    Row(
                      children: [
                        // view
                        GestureDetector(
                          onTap: () {
                            //
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ViewPdf(
                                  title: '',
                                  pdfUrl: '',
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
                              'View Circular',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        //apply
                        GestureDetector(
                          onTap: () {
                            //
                            UrlLauncher.launchURL(job.circularUrl);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.blueAccent,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: const Text(
                              'Apply',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
