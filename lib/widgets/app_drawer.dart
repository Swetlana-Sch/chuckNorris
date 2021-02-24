import 'package:chuck_norris_app/provider/chuck_norris_provider.dart';
import 'package:chuck_norris_app/screens/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chuckCategories = Provider.of<ChuckNorrisProvider>(context);
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text(
              'Chuckie',
            ),
          ),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: Text('Categories', style: TextStyle(fontSize: 18),),
            onTap: () {
              chuckCategories.getCategoryNames();
              Navigator.of(context).pushReplacementNamed(CategoriesScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
