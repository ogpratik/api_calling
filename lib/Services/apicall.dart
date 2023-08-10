import 'dart:convert';
import 'package:api_calling/CustomCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseurl =
      "https://mocki.io/v1/5059be7b-cc89-4d70-a7cd-70249d7fa9c1";

  fetchDoctors() async {
    final response = await http.get(Uri.parse(baseurl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      List<Doctor> doctors =
          jsonData.map((data) => Doctor.fromJson(data)).toList();
      return doctors;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
