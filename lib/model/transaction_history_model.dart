import 'package:financial_management/pages/budget/constants.dart';

class TransactionHistoryModel {
  final String? id;
  final String? goatId;
  final String? walletId;
  final String? categoryId;
  final String? categoryName;
  final double? amount;
  final double? balanceFrom;
  final double? balanceTo;
  final double? income;
  final double? spent;
  final String? note;
  final int? type;
  final int? icon;
  final String? date;
  final String? createdAt;
  final String? modifiedAt;

  TransactionHistoryModel({
    this.id,
    this.goatId,
    this.walletId,
    this.categoryId,
    this.categoryName,
    this.amount,
    this.balanceFrom,
    this.balanceTo,
    this.income,
    this.spent,
    this.note,
    this.type,
    this.icon,
    this.date,
    this.createdAt,
    this.modifiedAt,
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    return TransactionHistoryModel(
      id: json['id'] ?? '',
      goatId: json['goat_id'] ?? '',
      walletId: json['wallet_id'] ?? '',
      categoryId: json['category_id'] ?? '',
      categoryName: json['category_name'],
      amount: json['amount'] != null ? double.tryParse(json['amount']) : 0.0,
      balanceFrom: json['balance_from'] != null ? double.tryParse(json['balance_from']) : 0.0,
      balanceTo: json['balance_to'] != null ? double.tryParse(json['balance_to']) : 0.0,
      income: json['income'] != null ? double.tryParse(json['income']) : 0.0,
      spent: json['spent'] != null ? double.tryParse(json['spent']) : 0.0,
      note: json['note'] ?? '',
      type: json['type'] ?? TRANSACTION_TYPE_SPENT,
      icon: json['icon'] ?? 0,
      date: json['date'] ?? '',
      createdAt: json['created_at'] ?? '',
      modifiedAt: json['modified_at'] ?? '',
    );
  }
}

class TotalInOutModel {
  double income;
  double spent;

  TotalInOutModel({
    required this.income,
    required this.spent,
  });

  factory TotalInOutModel.fromJson(Map<String, dynamic> json) {
    return TotalInOutModel(
      income: double.tryParse(json['income']) ?? 0.0,
      spent: double.tryParse(json['spent']) ?? 0.0,
    );
  }
}

class InOutAnalyticsChartModel {
  TotalInOutModel total;
  List<TransactionHistoryModel> list;

  InOutAnalyticsChartModel({
    required this.total,
    required this.list,
  });

  factory InOutAnalyticsChartModel.fromJson(Map<String, dynamic> json) {
    return InOutAnalyticsChartModel(
      total: TotalInOutModel.fromJson(json['total']),
      list: List<TransactionHistoryModel>.from((json['list'].map((item) => TransactionHistoryModel.fromJson(item))),
    ));
  }

}