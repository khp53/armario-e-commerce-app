import 'package:armario/commons/text_style.dart';
import 'package:armario/screens/explore/explore_details.dart';
import 'package:armario/screens/explore/explore_grid.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List items = [
    {
      'image': "assets/images/1.jpg",
      'title': "Women's Coat (White)",
      'price': 55.00,
      'rating': 4.0,
    },
    {
      'image': "assets/images/2.jpg",
      'title': "Women's Coat (Blue)",
      'price': 55.00,
      'rating': 3.0,
    },
    {
      'image': "assets/images/3.jpg",
      'title': "Women's Coat (Grey)",
      'price': 55.00,
      'rating': 4.5,
    },
    {
      'image': "assets/images/4.jpg",
      'title': "Men's Coat (Brown)",
      'price': 45.00,
      'rating': 5.0,
    },
    {
      'image': "assets/images/5.jpg",
      'title': "Men's Jacket",
      'price': 38.80,
      'rating': 2.5,
    },
    {
      'image': "assets/images/6.jpg",
      'title': "Men's T-Shirt",
      'price': 13.99,
      'rating': 4.0,
    }
  ];

  List topTrend = [
    {
      'image': "assets/images/7.jpg",
      'title': "Leather Jacket",
      'price': 134.00,
      'brand': "Zara",
      'rating': 4.0,
    },
    {
      'image': "assets/images/8.jpg",
      'title': "Women's Pant",
      'price': 89.99,
      'brand': "H&M",
      'rating': 3.0,
    },
    {
      'image': "assets/images/9.jpg",
      'title': "Women's Yellow Top",
      'price': 25.99,
      'brand': "Forever 21",
      'rating': 2.0,
    },
    {
      'image': "assets/images/10.jpg",
      'title': "Pink Sweater",
      'price': 58.30,
      'brand': "Celio",
      'rating': 5.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header image section
            Container(
              height: 250,
              //width: double.infinity,
              child: Image(
                image: AssetImage("assets/images/cover_home.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // This is the actual body section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New Collection",
                        style: headingText(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExploreGrid(
                                title: "New Collection",
                                items: items,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "See all",
                          style: buttonText().copyWith(color: _theme.onPrimary),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // card for items
                  Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExploreDetails(
                                  image: items[index]['image'],
                                  title: items[index]['title'],
                                  price: items[index]['price'],
                                  rating: items[index]['rating'],
                                ),
                              ),
                            ),
                            child: itemCard(
                              image: items[index]['image'],
                              title: items[index]['title'],
                              price: items[index]['price'],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Trends",
                        style: headingText(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExploreGrid(
                                title: "Top Trends",
                                items: topTrend,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "See all",
                          style: buttonText().copyWith(color: _theme.onPrimary),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: topTrend
                          .map(
                            (e) => Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.all(20),
                                title: Text(e['title']),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Brand: ' + e['brand']),
                                    Text(e['price'].toString() + ' USD'),
                                  ],
                                ),
                                leading: Container(
                                  //height: 200,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(e['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemCard(
      {required String image, required String title, required double price}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: bodyText().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Text(
              price.toString() + ' USD',
              style: subtitleText(),
            ),
          ],
        ),
      ],
    );
  }
}
