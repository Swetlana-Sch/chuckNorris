import 'dart:convert';

import 'package:chuck_norris_app/models/chuck_catagory_fact.dart';
import 'package:chuck_norris_app/models/chuck_category_item.dart';
import 'package:chuck_norris_app/models/chuck_facts.dart';
import 'package:chuck_norris_app/widgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ChuckNorrisProvider with ChangeNotifier {
  // List<ChuckFacts> items = [];
  ChuckFacts chuckFactObject;
  var chuckCategoryNames;
  ChuckCategoryFact chuckFactsByCategory;

  // getting random fact about Chuck
  Future<void> getChuckFact() async {
    final url = 'https://api.chucknorris.io/jokes/random';
    try {
      final response = await http.get(url);
      final chuckFactsDecoded = jsonDecode(response.body);

      chuckFactObject = ChuckFacts(
        iconUrl: chuckFactsDecoded['icon_url'],
        id: chuckFactsDecoded['id'],
        url: chuckFactsDecoded['url'],
        value: chuckFactsDecoded['value'],
      );

      print('Chuck facts: $chuckFactObject');
      notifyListeners();
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> getCategoryNames() async {
    final url = 'https://api.chucknorris.io/jokes/categories';
    try {
      final response = await http.get(url);
      final chuckCategoryDecoded = jsonDecode(response.body);
      print('ChuckCategoryDecoded: $chuckCategoryDecoded');
      chuckCategoryNames = chuckCategoryDecoded;
      notifyListeners();
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> fetchFactsByCategory(String name) async {
    final url = 'https://api.chucknorris.io/jokes/random?category=$name';
    try {
      final response = await http.get(url);
      final chuckFactsByCategoryDecoded = jsonDecode(response.body);
      print('ChuckFactsByCategory: $chuckFactsByCategoryDecoded');
      // chuckFactsByCategory = chuckFactsByCategoryDecoded;
      chuckFactsByCategory = ChuckCategoryFact(
        value: chuckFactsByCategoryDecoded['value'],
      );
      notifyListeners();
    } catch (error) {
      print('Error: $error');
    }
  }
}
