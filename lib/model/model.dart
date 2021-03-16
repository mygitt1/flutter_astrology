import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Model {
  final String title;
  final String explanation;
  final DateTime dateTime;
  final String imageUrl;

  Model({
    this.title,
    this.explanation,
    this.dateTime,
    this.imageUrl,
  });
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      title: json['title'],
      explanation: json['explanation'],
      dateTime: DateFormat("yyyy-MM-dd").parse(json['date']),
      imageUrl: json['url'],
    );
  }
}

getData(date) async {
  var res = await http.get(
    'https://api.nasa.gov/planetary/apod?api_key=aWPhODExHc5j48m59viPzCysv1jkoaN7ID2dchPw&date=$date', // 2017-07-10
  );
  if (res.statusCode == 200) {
    return Model.fromJson(jsonDecode(res.body));
  } else {
    print('Failed to load Data');
  }
}
