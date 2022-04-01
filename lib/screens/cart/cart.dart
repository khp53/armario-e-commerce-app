import 'package:armario/commons/text_style.dart';
import 'package:armario/screens/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Cart extends StatefulWidget {
  final List cartItems;
  const Cart({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: bodyText(),
        ),
        automaticallyImplyLeading: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: _theme.primary),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(25),
                        leading: Container(
                          height: 60,
                          width: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image(
                              image: AssetImage(
                                widget.cartItems[i]['image'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(widget.cartItems[i]['title']),
                        subtitle: Text(
                            widget.cartItems[i]['price'].toString() + ' USD'),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete_outline,
                            color: _theme.error,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.cartItems.remove(widget.cartItems[i]);
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        color: _theme.primary,
                        height: 0.5,
                      ),
                      //Spacer(),
                    ],
                  );
                },
                separatorBuilder: (context, i) => Container(
                  color: _theme.primary,
                  height: 0.3,
                ),
                itemCount: widget.cartItems.length,
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: bodyText().copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.cartItems.isNotEmpty
                          ? widget.cartItems
                                  .map((e) => e['price'])
                                  .toList()
                                  .reduce((value, element) => value + element)
                                  .toString() +
                              ' USD'
                          : '0 USD',
                      style: bodyText(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                color: _theme.primary,
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 0.5,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  height: 50,
                  minWidth: MediaQuery.of(context).size.width,
                  child: Text(
                    "Checkout",
                    style: buttonText(),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: _theme.primary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Checkout(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
