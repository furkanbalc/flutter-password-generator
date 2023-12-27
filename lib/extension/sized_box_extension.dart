import 'package:flutter/material.dart';
import 'package:random_pass_generator/enum/app_sized_box.dart';

extension AppSizedBoxExtension on AppSizedBox {
  SizedBox get height {
    switch (this) {
      case AppSizedBox.low:
        return const SizedBox(height: 10);
      case AppSizedBox.med:
        return const SizedBox(height: 20);
      case AppSizedBox.high:
        return const SizedBox(height: 30);
      default:
        return const SizedBox();
    }
  }
}
