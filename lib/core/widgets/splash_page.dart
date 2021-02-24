import 'package:flutter/material.dart';
import 'file:///C:/Project/Flutter/flutter_app_clean_auth/lib/core/widgets/background.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Container(
                  child: SvgPicture.asset(
                    'assets/images/splash_book.svg',
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text('EBook',
                          style: TextStyle(fontSize: 30, color: Colors.blueAccent)),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
