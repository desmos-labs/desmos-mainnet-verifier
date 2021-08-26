import 'package:flutter/widgets.dart';

class Dimensions {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 940;
  }
}
