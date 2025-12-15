import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  /// Screen title: "Main"
  static TextStyle get screenTitle => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,  // Usually titles are semi-bold
    color: const Color(0xFF8E8E93), // Dark gray
  );
}
