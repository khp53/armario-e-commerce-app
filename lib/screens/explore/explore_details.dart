import 'package:armario/commons/text_style.dart';
import 'package:armario/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ExploreDetails extends StatefulWidget {
  final String image;
  final String title;
  final double price;
  final double rating;
  const ExploreDetails({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
  }) : super(key: key);

  @override
  State<ExploreDetails> createState() => _ExploreDetailsState();
}

class _ExploreDetailsState extends State<ExploreDetails> {
  List cartItems = [];
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
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
      body: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20),
              height: 350,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: _theme.background.withOpacity(0.8),
                border: Border.all(
                  color: _theme.background,
                  width: 4.0,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.title,
                    style: headingText(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.price.toString() + ' USD',
                    style: headingText().copyWith(fontSize: 22),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RatingBar.builder(
                    unratedColor: Colors.grey[400],
                    itemSize: 28,
                    initialRating: widget.rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: _theme.onPrimary,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 70,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      textAlign: TextAlign.center,
                      style: bodyText(),
                    ),
                  ),
                  Spacer(),
                  MaterialButton(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add to bag",
                          style: buttonText(),
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    color: _theme.onPrimary,
                    onPressed: () {
                      cartItems.add({
                        'image': widget.image,
                        'title': widget.title,
                        'price': widget.price,
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Cart(cartItems: cartItems),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
