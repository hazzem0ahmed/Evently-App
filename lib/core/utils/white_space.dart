import 'package:flutter/material.dart';

extension WhiteSpace on num {
  Widget spaceVertical() {
    return SizedBox(height: toDouble());
  }

  Widget spaceHorizontal() {
    return SizedBox(width: toDouble());
  }
}
