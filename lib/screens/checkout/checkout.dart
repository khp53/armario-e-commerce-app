import 'package:armario/commons/text_style.dart';
import 'package:armario/screens/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
                      color: Colors.grey[400],
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.add_card_outlined,
                      color: Colors.grey[400],
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
                "Step 1",
                style: subtitleText().copyWith(color: Colors.grey[500]),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Shipping",
                style: headingText(),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  hintText: "Full Name",
                  labelText: "Full Name",
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  hintText: "Street address",
                  labelText: "Street address",
                  prefixIcon: Icon(Icons.map_outlined),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        hintText: "City",
                        labelText: "City",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        hintText: "Zip Code",
                        labelText: "Zip Code",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  hintText: "Country",
                  labelText: "Country",
                  prefixIcon: Icon(Icons.location_on_outlined),
                ),
              ),
              Spacer(),
              MaterialButton(
                height: 50,
                minWidth: MediaQuery.of(context).size.width,
                child: Text(
                  "Continue to Payment",
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
                      builder: (context) => Payment(),
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
