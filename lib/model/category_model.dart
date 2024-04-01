import 'package:financial_management/core/color.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final int icon;
  final int status;
  final double? amountUsed;
  Color? color;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.icon,
      required this.status,
      required this.amountUsed,
      color,
      }): color = color ?? AppColors.randomColor();

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      status: json['status'] ?? CATEGORY_ACTIVE,
      amountUsed: json['amount_used'] ?? 0.0,
    );
  }
}

const int CATEGORY_INACTIVE = 0;
const int CATEGORY_ACTIVE = 1;
