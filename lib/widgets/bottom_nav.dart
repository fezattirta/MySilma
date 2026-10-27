import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: NavigationBar(
        height: 65,
        selectedIndex: currentIndex,
        onDestinationSelected: onTap,
        backgroundColor: Colors.white,
        elevation: 0,
        indicatorColor: AppTheme.primaryLight,
        labelBehavior:
            NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              size: 19,
            ),
            selectedIcon: Icon(
              Icons.home_rounded,
              size: 19,
              color: AppTheme.primary,
            ),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.calendar_month_outlined,
              size: 19,
            ),
            selectedIcon: Icon(
              Icons.calendar_month_rounded,
              size: 19,
              color: AppTheme.primary,
            ),
            label: 'Booking',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.groups_outlined,
              size: 19,
            ),
            selectedIcon: Icon(
              Icons.groups_rounded,
              size: 19,
              color: AppTheme.primary,
            ),
            label: 'Mabar',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.receipt_long_outlined,
              size: 19,
            ),
            selectedIcon: Icon(
              Icons.receipt_long_rounded,
              size: 19,
              color: AppTheme.primary,
            ),
            label: 'Jadwal Saya',
          ),
        ],
      ),
    );
  }
}