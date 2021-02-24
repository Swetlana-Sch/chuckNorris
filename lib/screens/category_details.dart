import 'package:chuck_norris_app/provider/chuck_norris_provider.dart';
import 'package:chuck_norris_app/widgets/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const routeName = '/category-details';


  @override
  Widget build(BuildContext context) {
    final chuckDetailsByCategory = Provider.of<ChuckNorrisProvider>(context);
    final catName = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(catName),
      ),
      body: Card(
        child: Text(chuckDetailsByCategory.chuckFactsByCategory?.value ??''),
      ),
      drawer: AppDrawer(),
    );
  }
}
