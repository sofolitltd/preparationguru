import 'package:flutter/material.dart';

import '../../../utils/expendable_text.dart';

class TodayActivitySection extends StatelessWidget {
  const TodayActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Today\'s Activity',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),

          const SizedBox(height: 16),

          //
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black12),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'English Literature',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          // fontWeight: FontWeight.bold,
                          ),
                    ),

                    //
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Exam 1',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 12,
                              height: 1,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //
                    Row(
                      children: [
                        Text(
                          'Mark:',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                        ),

                        const SizedBox(width: 8),

                        //
                        Text(
                          '20',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 16),

                    //
                    Row(
                      children: [
                        Text(
                          'Duration:',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                        ),

                        const SizedBox(width: 8),

                        //
                        Text(
                          '20 min',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                //
                const ExpandableText(
                  text:
                      'BCS english syllabus preliminary has two parts. Language and literature, Now we share about BCS english syllabus preliminary with important topics.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
