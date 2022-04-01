import 'package:armario/commons/text_style.dart';
import 'package:armario/screens/explore/explore_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExploreGrid extends StatelessWidget {
  final String title;
  final List items;
  const ExploreGrid({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          title,
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
      body: Container(
        margin: EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisExtent: 310,
            childAspectRatio: 1 / 2,
            crossAxisSpacing: 20,
            //mainAxisSpacing: 10,
          ),
          itemCount: items.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExploreDetails(
                    image: items[i]['image'],
                    title: items[i]['title'],
                    price: items[i]['price'],
                    rating: items[i]['rating'],
                  ),
                ),
              ),
              child: itemCard(
                image: items[i]['image'],
                title: items[i]['title'],
                price: items[i]['price'],
              ),
            );
          },
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
