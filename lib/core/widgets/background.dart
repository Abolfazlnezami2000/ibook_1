import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
                "assets/images/top1.svg",
                width: size.width
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
                "assets/images/top2.svg",
                width: size.width
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset(
                "assets/images/bottom1.svg",
                width: size.width
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset(
                "assets/images/bottom2.svg",
                width: size.width
            ),
          ),
          child
        ],
      ),
    );
  }
}