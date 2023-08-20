import 'package:flutter/material.dart';
import 'package:api_calling/VerticalCardList.dart';

class Review {
  final String userName;
  final double rating;
  final String review;
  final String avatarUrl;

  Review({
    required this.userName,
    required this.rating,
    required this.review,
    required this.avatarUrl,
  });
}

class ReviewsList extends StatefulWidget {
  final List<Review> reviews;

  const ReviewsList({super.key, required this.reviews});

  @override
  State<ReviewsList> createState() => _ReviewsListState();
}

class _ReviewsListState extends State<ReviewsList> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      height: 200,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.reviews.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              final review = widget.reviews[index];
              return Container(
                width: 450,
                // color: Theme.of(context).scaffoldBackgroundColor,
                margin: const EdgeInsets.all(8),
                // color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Reviews",
                      style: TextStyle(
                        color: Colors.black38,
                        // fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Patient Reviews on doctors",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(review.avatarUrl),
                          radius: 40,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  review.review,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                              child: Text(
                                review.rating.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              review.userName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(widget.reviews.length, (index) {
                double scaleFactor = _currentPage == index ? 1.5 : 1.0;
                return Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.red : Colors.grey,
                  ),
                  transform: Matrix4.identity()..scale(scaleFactor),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewsPage extends StatelessWidget {
  final List<Review> reviews = [
    Review(
      userName: 'John Doe',
      rating: 4.5,
      review:
          'Dr. Smith was amazing! He listened to my concerns and provided thorough explanations for my treatment options. The staff was also very courteous and the clinic environment was comfortable.',
      avatarUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEsvd4C2TwjtX7awrBmO2jjdGvWYIDKoF0Ng&usqp=CAU',
    ),
    Review(
      userName: 'Jane Smith',
      rating: 5.0,
      review:
          'I had a fantastic experience with Dr. Johnson. The care and attention I received were exceptional. The clinics ambiance was relaxing, and the staff members were welcoming and professional.',
      avatarUrl:
          'https://plus.unsplash.com/premium_photo-1674777843203-da3ebb9fbca0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60',
    ),
    Review(
      userName: 'Robert Williams',
      rating: 4.5,
      review:
          'Dr. Rodriguez is a knowledgeable and caring professional. She took the time to address all my questions and concerns. The clinics state-of-the-art facilities and the friendly staff made my visit a pleasant one.',
      avatarUrl:
          'https://www.allprodad.com/wp-content/uploads/2021/03/05-12-21-happy-people.jpg',
    ),
    Review(
      userName: 'Emily Brown',
      rating: 5.0,
      review:
          'I can\'t thank Dr. Anderson enough for his exceptional care. He made me feel comfortable throughout my visit and explained the treatment process in a way that was easy to understand. The staff was supportive and friendly.',
      avatarUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3NkBq3IgplwZ5jdpbIFKy7cj-9peO69SGXQ&usqp=CAU.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ReviewsList(reviews: reviews);
  }
}
