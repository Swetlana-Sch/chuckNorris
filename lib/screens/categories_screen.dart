import 'package:chuck_norris_app/provider/chuck_norris_provider.dart';
import 'package:chuck_norris_app/screens/category_details.dart';
import 'package:chuck_norris_app/widgets/app_drawer.dart';
import 'package:chuck_norris_app/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories-screen';

  @override
  Widget build(BuildContext context) {
    final chuckCategories = Provider.of<ChuckNorrisProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) =>
            CategoryItem(chuckCategories.chuckCategoryNames[i], () {
          Navigator.of(context).pushNamed(CategoryDetailScreen.routeName, arguments: chuckCategories.chuckCategoryNames[i]);
          chuckCategories
              .fetchFactsByCategory(chuckCategories.chuckCategoryNames[i]);
        }),
        itemCount: chuckCategories.chuckCategoryNames?.length ?? 0,
      ),
      drawer: AppDrawer(),
    );
  }
}
