import 'package:api_calling/Services/apicall.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'VerticalCardList.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ApiServices>(
          create: (_) => ApiServices(),
        ),
      ],
      child: MaterialApp(
          home: VerticalCardList(), debugShowCheckedModeBanner: false)));
  ;
}
