import 'dart:convert';
import 'package:api_calling/CustomCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices extends ChangeNotifier {
  // final String baseurl =
  //     "https://mocki.io/v1/5059be7b-cc89-4d70-a7cd-70249d7fa9c1";
  final String baseurl =
      "https://mocki.io/v1/89384cd5-6df9-43fc-bbfb-8f749f72fbb0";
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
