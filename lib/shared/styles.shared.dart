import 'package:flutter/material.dart';

import 'colors.shared.dart';

class AppStyles {
  AppStyles._();

  static const TextStyle studentName = TextStyle(fontSize: 17,
    fontWeight: FontWeight.w800,
    color: AppColors.primaryColor,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle className = TextStyle(fontSize: 30,
      fontWeight: FontWeight.w800,
      color: AppColors.primaryColor,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none
  );
}