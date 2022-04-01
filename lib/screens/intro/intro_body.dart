import 'package:armario/commons/text_style.dart';
import 'package:armario/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 600,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                ),
                child: Image(
                  image: AssetImage("assets/images/1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: _theme.background,
              ),
              child: Column(
                children: [
                  Text(
                    "Stylish Cloths, Stylish Life",
                    style: headingText(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Armario has survived not only five centuries,\nbut also the leap",
                    textAlign: TextAlign.center,
                    style: subtitleText(),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: headingText().copyWith(fontSize: 22),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: _theme.secondary,
                          size: 32,
                        )
                      ],
                    ),
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
