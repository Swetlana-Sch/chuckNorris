import 'package:chuck_norris_app/provider/chuck_norris_provider.dart';
import 'package:chuck_norris_app/screens/category_details.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Function onCategoryTap;

  CategoryItem(this.title, this.onCategoryTap);

  @override
  Widget build(BuildContext context) {
    final chuckCategories = Provider.of<ChuckNorrisProvider>(context);
    return GestureDetector(
      onTap: () {
        onCategoryTap();
      },
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
