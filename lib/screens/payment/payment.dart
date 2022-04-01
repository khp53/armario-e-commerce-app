import 'package:armario/commons/text_style.dart';
import 'package:armario/screens/payment/order_confirm_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: Colors.grey[400],
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.check_circle_outline,
                      color: Colors.grey[400],
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Step 2",
                style: subtitleText().copyWith(color: Colors.grey[500]),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Payment",
                style: headingText(),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    card(
                      context,
                      Color(0xff1981D1),
                      Color(0xff0A53C1),
                      'assets/images/002-visa.png',
                      '01238039084230',
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    card(
                      context,
                      Color(0xff480910),
                      Color(0xff722830),
                      'assets/images/004-american-express.png',
                      '2434536545656',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 1.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      " Or With  ",
                      style: subtitleText().copyWith(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 1.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.grey[400]!,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {},
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Image(
                    image: AssetImage("assets/images/003-paypal.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.grey[400]!,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {},
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Image(
                    image: AssetImage("assets/images/001-apple-pay.png"),
                  ),
                ),
              ),
              Spacer(),
              MaterialButton(
                height: 50,
                minWidth: MediaQuery.of(context).size.width,
                child: Text(
                  "Make Payment",
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
                      builder: (context) => OrderConfirmPage(),
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

  Widget card(
    BuildContext context,
    Color color1,
    Color color2,
    String logo,
    String cardNumber,
  ) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.2),
            //     blurRadius: 16,
            //     spreadRadius: 8,
            //     offset: Offset(2, 4),
            //   )
            // ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 70,
            width: 130,
            child: Image(
              image: AssetImage(
                logo,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          top: 155,
          left: 30,
          child: Text(
            cardNumber,
            style: bodyText().copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
