import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class GuessAgeApi {
  final String guessAgeURL = 'https://api.agify.io?name=';

  Future<int> guessAge({required String name}) async {
    String finalURL = guessAgeURL + name;
    print(finalURL);

    var url = Uri.parse(finalURL);
    try {
      var response = await http.get(url);
      var data = jsonDecode(response.body);
      print('Data fetched:  ${data.toString()}');

      if(data['age'] != null) {
        return data['age'];
      }
      else{
        throw Exception('Error guessing age');
      }
    }
    catch (e){
      print('Error fetching data: ${e.toString()}');
      rethrow;
    }
  }
}