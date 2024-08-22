import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:preparation_guru/screens/home/category/notes/notes.dart';

import '/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final List<Category> categories;
  final int index;

  const CategoryCard({
    super.key,
    required this.categories,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Notes(),
              ),
            );
            break;
          default:
            Fluttertoast.showToast(msg: 'No data found');
        }
      },
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                categories[index].name,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Positioned(
              right: -50,
              child: Transform.rotate(
                angle: 150,
                alignment: Alignment.center,
                child: Container(
                  width: 115,
                  height: 115,
                  decoration: BoxDecoration(
                    color: categories[index].color.withOpacity(.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    categories[index].icon,
                    size: 50,
                    color: Colors.black.withOpacity(.3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
