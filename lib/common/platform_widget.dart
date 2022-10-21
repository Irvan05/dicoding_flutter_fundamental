import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'globals.dart';

class PlatformWidget extends StatelessWidget {
  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;

  PlatformWidget(
      {Key? key, required this.androidBuilder, required this.iosBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // switch (defaultTargetPlatform) {
    //   case TargetPlatform.android:
    //     return androidBuilder(context);
    //   case TargetPlatform.iOS:
    //     return iosBuilder(context);
    //   default:
    //     return androidBuilder(context);
    // }
    switch (isIos) {
      case isIos:
        return iosBuilder(context);
      case !isIos:
        return androidBuilder(context);
      default:
        return androidBuilder(context);
    }
  }
}
