import 'package:flutter/material.dart';
import 'package:api_calling/main.dart';

class Doctor {
  final String title;
  final String description;
  // final String image;
  Doctor({
    required this.title,
    required this.description,
    // required this.image
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(title: json['title'], description: json['description']);
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String description;

  const CustomCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      elevation: 20,
      margin: const EdgeInsets.all(10),
      child: Container(
        width: 600,
        height: 150,
        // color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 500,
                height: 60,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [Colors.green, Colors.white])),
                // color: Colors.red,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.all(Radius.circular(10)),
                          // ),
                          margin: EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://img.freepik.com/premium-photo/healthcare-medical-concept-young-male-doctor-with-stethoscope-hospital_380164-53003.jpg',
                              width: 50,
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              description,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.more_horiz),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.access_time, color: Colors.white, size: 16),
                        SizedBox(width: 5),
                        Text(
                          '09:30 - 6:30',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  // sized  box for properly align Book Button
                  Column(
                    children: [
                      Container(
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 12,
                            shadowColor: Colors.red,
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          child: const Text(
                            'Book',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
