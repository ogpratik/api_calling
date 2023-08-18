import 'package:api_calling/Services/apicall.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CustomCard.dart';

class VerticalCardList extends StatefulWidget {
  @override
  State<VerticalCardList> createState() => _VerticalCardListState();
}

class _VerticalCardListState extends State<VerticalCardList> {
  // late List<Doctor> futureDoctors;
  late ApiServices apiServices;

  @override
  void initState() {
    super.initState();
    // _loadDoctors();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    apiServices = Provider.of<ApiServices>(context, listen: false);
    apiServices.fetchDoctors();
  }

  // _loadDoctors() async {
  //   futureDoctors = await ApiServices().fetchDoctors();
  //   setState(() {});
  // }

//create doctor provider class and dont use future
  @override
  Widget build(BuildContext context) {
    apiServices = Provider.of<ApiServices>(context);

    // if (futureDoctors == null) {
    //   return Center(child: CircularProgressIndicator());
    // } else if (futureDoctors.isEmpty) {
    //   return Center(child: Text('No  doctors available'));
    // }
    return Scaffold(
      appBar: AppBar(title: const Text('Doctors List')),
      // body: ListView.builder(
      //   itemCount: 2,
      //   itemBuilder: (context, index) {
      //     return CustomCard(
      //       title: 'Card $index',
      //       description: 'This is the description for Card $index.',
      //     );
      //   },
      // ),
      body: apiServices.doctors.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 500,
                    child: ListView(
                        children:
                            List.generate(apiServices.doctors.length, (index) {
                      return ListTile(
                        title: Column(
                          children: <Widget>[
                            CustomCard(
                                title: apiServices.doctors[index].title,
                                description:
                                    apiServices.doctors[index].description)
                          ],
                        ),
                      );
                    })),
                  ),
                  // Container(width: 200, height: 200, color: Colors.red)
                ],
              ),
            ),
    );
  }
}
