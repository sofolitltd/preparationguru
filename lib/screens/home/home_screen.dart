import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '/utils/logo.dart';
import 'activity/today_activity_section.dart';
import 'category/category_section.dart';
import 'quote/quote_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {},
            child: const Badge(
              label: Text(
                '1',
                style: TextStyle(
                  height: 1,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  IconsaxPlusLinear.notification,
                  size: 22,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView(
        children: const [
          //
          CategorySection(),

          //
          QuoteSection(),

          //
          TodayActivitySection(),
        ],
      ),
    );
  }
}
