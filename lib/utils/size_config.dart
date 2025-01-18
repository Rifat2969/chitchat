import 'package:flutter/widgets.dart';

class SizeConfig {
  static double width = 0;
  static double height = 0;
  static double statusBar = 0;
  static double bottomBar = 0;

  static bool isPortrait = false;
  static bool isSmall = false;
  static bool isMobile = false;
  static bool isTablet = false;
  static bool isDesktop = false;
  static bool bottomNotch = false;

  static void initMediaQuery(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    width = mediaQuery.size.width;
    height = mediaQuery.size.height;
    statusBar = mediaQuery.padding.top;
    bottomBar = mediaQuery.viewPadding.bottom;
    bottomNotch = mediaQuery.viewPadding.bottom > 0;
  }

  static void initLayoutBuilder(BoxConstraints constraints, Orientation orientation) {
    width = constraints.maxWidth;
    height = constraints.maxHeight;
    isSmall = width <= 375;
    isMobile = width < 601;
    isTablet = width >= 601 && width < 1024;
    isDesktop = width >= 1100;
    isPortrait = orientation == Orientation.portrait;
  }
}
