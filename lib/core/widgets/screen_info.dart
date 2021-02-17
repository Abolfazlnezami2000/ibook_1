import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
typedef ChildWidgetBuilder = Widget Function(
    BuildContext context,
    ScreenInfo screenInfo,
    );

class BasicContainer extends StatelessWidget {
  final ChildWidgetBuilder builder;

  const BasicContainer({
    Key key,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        ScreenInfo screenInfo = _setScreenInfo(screenSize: sizingInformation);
        return Container(
          alignment: Alignment.topCenter,
          // height: screenInfo.height,
          // width: screenInfo.width,
          child: builder(context, screenInfo),
        );
      },
    );
  }

  ScreenInfo _setScreenInfo({@required final SizingInformation screenSize}) => ScreenInfo(
    height: screenSize.localWidgetSize.height,
    width: screenSize.localWidgetSize.width,
  );
}

class ScreenInfo {
  final double height;
  final double width;

  ScreenInfo({@required this.height, @required this.width});
}