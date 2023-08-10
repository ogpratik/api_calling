import 'package:api_calling/Services/apicall.dart';
import 'package:flutter/material.dart';
import 'CustomCard.dart';

class VerticalCardList extends StatefulWidget {
  @override
  State<VerticalCardList> createState() => _VerticalCardListState();
}

class _VerticalCardListState extends State<VerticalCardList> {
  late List<Doctor> futureDoctors;

  @override
  void initState() {
    super.initState();
    _loadDoctors();
  }

  _loadDoctors() async {
    futureDoctors = await ApiServices().fetchDoctors();
    setState(() {});
  }

//create doctor provider class and dont use future
  @override
  Widget build(BuildContext context) {
    // List<Doctor> doctors = [
    //   Doctor(title: 'Dr. John Doe', description: 'Cardiologist'),
    //   Doctor(title: 'Dr. Jane Smith', description: 'Pediatrician'),
    //   Doctor(title: 'Dr. Michael Johnson', description: 'Orthopedic Surgeon'),
    //   Doctor(title: 'Dr. John Doe', description: 'Cardiologist'),
    //   Doctor(title: 'Dr. Jane Smith', description: 'Pediatrician'),
    //   Doctor(title: 'Dr. Michael Johnson', description: 'Orthopedic Surgeon'),
    //   Doctor(title: 'Dr. John Doe', description: 'Cardiologist'),
    //   Doctor(title: 'Dr. Jane Smith', description: 'Pediatrician'),
    //   Doctor(title: 'Dr. Michael Johnson', description: 'Orthopedic Surgeon')
    // ];

    if (futureDoctors == null) {
      return Center(child: CircularProgressIndicator());
    } else if (futureDoctors.isEmpty) {
      return Center(child: Text('No  doctors available'));
    }
    return Scaffold(
      appBar: AppBar(title: Text('Doctors List')),
      // body: ListView.builder(
      //   itemCount: 2,
      //   itemBuilder: (context, index) {
      //     return CustomCard(
      //       title: 'Card $index',
      //       description: 'This is the description for Card $index.',
      //     );
      //   },
      // ),
      body: ListView(
          children: List.generate(futureDoctors.length, (index) {
        return ListTile(
          // title: Text(doctors[index].title),
          // subtitle: Text(doctors[index].description),
          title: Column(
            children: <Widget>[
              CustomCard(
                  title: futureDoctors[index].title,
                  description: futureDoctors[index].description)
            ],
          ),
        );
      })),
    );
  }
}
