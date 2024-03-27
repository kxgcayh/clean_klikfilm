import 'package:flutter/widgets.dart';

extension StringWidgetExtension on String {
  Text text({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) {
    return Text(
      this,
      style: TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight, fontFamily: fontFamily),
    );
  }
}

extension TextExtension on Text {
  // Text styleText({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  //   String? fontFamily,
  // }) {
  //   return Text(
  //     data ?? '',
  //     style: TextStyle(
  //       color: color ?? style?.color,
  //       fontSize: fontSize ?? style?.fontSize,
  //       fontWeight: fontWeight ?? style?.fontWeight,
  //       fontFamily: fontFamily ?? style?.fontFamily,
  //     ),
  //   );
  // }

  Text color(Color color) {
    return Text(
      data ?? '',
      style: TextStyle(
        color: color,
        fontSize: style?.fontSize,
        fontWeight: style?.fontWeight,
        fontFamily: style?.fontFamily,
      ),
    );
  }

  Text weight(FontWeight fontWeight) {
    return Text(
      data ?? '',
      style: TextStyle(
        color: style?.color,
        fontSize: style?.fontSize,
        fontWeight: fontWeight,
        fontFamily: style?.fontFamily,
      ),
    );
  }
}
