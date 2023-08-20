import 'package:api_calling/Services/apicall.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CustomCard.dart';
import 'review.dart';

class VerticalCardList extends StatefulWidget {
  @override
  State<VerticalCardList> createState() => _VerticalCardListState();
}

class _VerticalCardListState extends State<VerticalCardList> {
  late ApiServices apiServices;
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    apiServices = Provider.of<ApiServices>(context, listen: false);
    apiServices.fetchDoctors();
  }

  @override
  Widget build(BuildContext context) {
    apiServices = Provider.of<ApiServices>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Doctors List')),
      body: apiServices.doctors.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 500,
                    child: ListView.builder(
                      itemCount: apiServices.doctors.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Column(
                            children: <Widget>[
                              CustomCard(
                                title: apiServices.doctors[index].title,
                                description:
                                    apiServices.doctors[index].description,
                                image: apiServices.doctors[index].image,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  ReviewsList(reviews: ReviewsPage().reviews),
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
