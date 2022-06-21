import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Categories {
  work,
  social,
  all,
  shopping,
  other,
}

extension CategoriesFunctions on Categories {
  String get categoryString => describeEnum(categoryString).capitalize();

  Color get categoryColors {
    switch (this) {
      case Categories.work:
        return Color(0xd4afb9);
      case Categories.social:
        return Color(0xd1cfe2);
      case Categories.all:
        return Color(0x9cadce);
      case Categories.shopping:
        return Color(0x7ec4cf);
      case Categories.other:
        return Color(0xdaeaf6);
      default:
        return Color(0x9cadce);
    }
  }
}

extension CapitalizeString on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
