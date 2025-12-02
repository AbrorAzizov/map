import 'package:boycot/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_strings.dart';

class LayoutScaffold extends StatelessWidget {
  const LayoutScaffold({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('LayoutScaffold'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,

      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: 20.h,
          left: 20.w,
          right: 20.w,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryGreen.withOpacity(0.15),
                  blurRadius: 20.r,
                  spreadRadius: 5.r,
                  offset: Offset(0, 6.h),
                ),
              ],
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              currentIndex: navigationShell.currentIndex,

              onTap: (index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index != navigationShell.currentIndex,
                );
              },

              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12.sp,
              unselectedFontSize: 11.sp,
              iconSize: 22.sp,

                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined, color: Colors.grey),
                    activeIcon: Icon(Icons.home, color: AppColors.primaryGreen),
                    label: AppStrings.home,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list_outlined, color: Colors.grey),
                    activeIcon: Icon(Icons.list, color: AppColors.primaryGreen),
                    label: AppStrings.list,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border, color: Colors.grey),
                    activeIcon: Icon(Icons.favorite, color: AppColors.primaryGreen),
                    label: AppStrings.support,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined, color: Colors.grey),
                    activeIcon: Icon(Icons.settings, color: AppColors.primaryGreen),
                    label: AppStrings.settings,
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
