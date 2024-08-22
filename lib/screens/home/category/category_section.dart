import 'package:flutter/material.dart';

import '/models/category_model.dart';
import '../category/category_card.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        itemCount: categories.length,
        itemBuilder: (_, index) {
          return CategoryCard(
            categories: categories,
            index: index,
          );
        },
      ),
    );
  }
}

//
final List<Category> categories = [
  Category(name: 'Notes', color: Colors.blue, icon: Icons.class_outlined),
  Category(name: 'Exam', color: Colors.red, icon: Icons.assessment_outlined),
  Category(
      name: 'Question\nBank',
      color: Colors.green,
      icon: Icons.question_answer_outlined),
  Category(name: 'Archive', color: Colors.amber, icon: Icons.archive_outlined),
];
