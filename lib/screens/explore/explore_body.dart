import 'package:armario/commons/text_style.dart';
import 'package:armario/screens/explore/explore_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class ExploreBody extends StatelessWidget {
  ExploreBody({Key? key}) : super(key: key);

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
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          "Explore",
          style: bodyText(),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: _theme.onPrimary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              _textField(),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExploreGrid(
                      title: "New Collection",
                      items: items,
                    ),
                  ),
                ),
                child: exploreCard(
                  "assets/images/4.jpg",
                  "New Collection",
                  "UP TO 70% OFF",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExploreGrid(
                      title: "Top Trends",
                      items: topTrend,
                    ),
                  ),
                ),
                child: exploreCard(
                  "assets/images/10.jpg",
                  "Top Trends",
                  "UP TO 50% OFF",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container exploreCard(String image, String title, String discount) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: headingText().copyWith(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              discount,
              style: subtitleText().copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _textField() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        hintText: "Search",
        labelText: "Search",
        prefixIcon: Icon(
          Icons.search_outlined,
        ),
        suffixIcon: Icon(
          Icons.mic_outlined,
        ),
      ),
    );
  }
}
