import 'package:chuck_norris_app/provider/chuck_norris_provider.dart';
import 'package:chuck_norris_app/widgets/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChuckFactsMainScreen extends StatefulWidget {
  @override
  _ChuckFactsMainScreenState createState() => _ChuckFactsMainScreenState();
}

class _ChuckFactsMainScreenState extends State<ChuckFactsMainScreen> {
  @override
  Widget build(BuildContext context) {
    final chuckData = Provider.of<ChuckNorrisProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chuck the Norris!!!'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (chuckData.chuckFactObject == null)
              ? CircularProgressIndicator()
              : Image.network(chuckData.chuckFactObject.iconUrl),
          (chuckData.chuckFactObject == null)
              ? CircularProgressIndicator()
              : Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  margin: EdgeInsets.all(10),
                    child: Text(chuckData.chuckFactObject.value, style: TextStyle(fontSize: 18),),
                  ),
              ),
        ],
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => chuckData.getChuckFact(),
      ),
    );
  }
}
