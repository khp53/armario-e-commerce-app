import 'package:armario/commons/text_style.dart';
import 'package:armario/screens/home/home.dart';
import 'package:armario/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderConfirmPage extends StatelessWidget {
  const OrderConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Checkout",
          style: bodyText(),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.location_on,
                      color: _theme.primary,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 1.5,
                      color: _theme.primary,
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.add_card_outlined,
                      color: _theme.primary,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 1.5,
                      color: _theme.primary,
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.check_circle,
                      color: _theme.primary,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: _theme.primary,
                      size: 130,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Order Confirmed!",
                      style: headingText(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Your order has been placed successfully!\nWe will contact you soon.",
                      textAlign: TextAlign.center,
                      style: subtitleText(),
                    ),
                  ],
                ),
              ),
              Spacer(),
              MaterialButton(
                height: 50,
                minWidth: MediaQuery.of(context).size.width,
                child: Text(
                  "Back to Home",
                  style: buttonText(),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: _theme.primary,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
