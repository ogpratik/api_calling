import 'package:flutter/material.dart';
import 'package:api_calling/main.dart';

class Doctor {
  final String title;
  final String description;
  Doctor({required this.title, required this.description});

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
      elevation: 20,
      margin: const EdgeInsets.all(10),
      child: Container(
        width: 600,
        height: 120,
        // color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 500,
                height: 45,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [Colors.green, Colors.white])),
                // color: Colors.red,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        'https://img.freepik.com/premium-photo/healthcare-medical-concept-young-male-doctor-with-stethoscope-hospital_380164-53003.jpg',
                        width: 30,
                        height: 80,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                // overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 180,
                              ),
                              const Icon(Icons.more_horiz),
                            ],
                          ),
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
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 130,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.white, size: 20),
                        SizedBox(width: 5),
                        Text(
                          '09:30 - 6:30',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                      width: 125), // sized  box for properly align Book Button
                  Column(
                    children: [
                      Container(
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
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
