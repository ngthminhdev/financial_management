import 'package:flutter/material.dart';

class BarItem {
  final IconData icon;
  final Color? activeColor;
  final Color? inactiveColor;
  final String title;
  BarItem({
    required this.title,
    required this.icon,
    this.activeColor,
    this.inactiveColor,
  });
}
