import 'dart:convert';
import 'package:api_calling/CustomCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices extends ChangeNotifier {
  final String baseurl =
      "https://mocki.io/v1/bfecc704-2dc4-43cd-81e5-daae4efe2cea";
  List<Doctor> doctors = [];

  fetchDoctors() async {
    final response = await http.get(Uri.parse(baseurl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      doctors = jsonData.map((data) => Doctor.fromJson(data)).toList();
      // return doctors;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
