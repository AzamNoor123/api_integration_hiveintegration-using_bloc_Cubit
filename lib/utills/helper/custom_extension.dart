import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  double get CT_height => MediaQuery.of(this).size.height;

  double get CT_width => MediaQuery.of(this).size.height;
}
