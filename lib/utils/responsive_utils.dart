// responsive_utils.dart
import 'package:flutter/material.dart';

final class Sizer {
  final BuildContext _context;
  Sizer._(BuildContext context) : _context = context;
  static Sizer of(BuildContext context) {
    return Sizer._(context);
  }

  double _screenWidth() {
    return MediaQuery.of(_context).size.width;
  }

  double _screenHeight() {
    return MediaQuery.of(_context).size.height;
  }

  double _responsiveWidth(double percentage) {
    return _screenWidth() * percentage;
  }

  double _responsiveHeight(BuildContext context, double percentage) {
    return _screenHeight() * percentage;
  }

  double fontSize(double fontSize) {
    return MediaQuery.of(_context)
        .textScaler
        .clamp(minScaleFactor: 0.9, maxScaleFactor: 1)
        .scale(fontSize);
  }

  MediaQueryData get mq => MediaQuery.of(_context);

  double get width => _screenWidth();
  double get height => _screenHeight();

  double responsiveWidth(double percentage) => _responsiveWidth(percentage);
  double responsiveHeight(double percentage) =>
      _responsiveHeight(_context, percentage);
}
