import 'dart:convert';

import 'package:chuck_norris_app/models/chuck_facts.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ChuckNorrisProvider with ChangeNotifier {
  // List<ChuckFacts> items = [];
  var chuckFactObject;

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
}
