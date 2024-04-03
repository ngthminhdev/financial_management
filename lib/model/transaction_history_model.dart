class TransactionHistoryModel {
  final String? id;
  final String? goatId;
  final String? walletId;
  final int? categoryId;
  final String? categoryName;
  final double? amount;
  final double? balanceFrom;
  final double? balanceTo;
  final String? note;
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
    this.note,
    this.createdAt,
    this.modifiedAt,
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    return TransactionHistoryModel(
      id: json['id'],
      goatId: json['goat_id'],
      walletId: json['wallet_id'],
      categoryId: json['category_id'],
      amount: double.tryParse(json['amount']) ?? 0.0,
      balanceFrom: double.tryParse(json['balance_from']) ?? 0.0,
      balanceTo: double.tryParse(json['balance_to']) ?? 0.0,
      note: json['note'] ?? '',
      createdAt: json['created_at'],
      modifiedAt: json['modified_at'],
    );
  }
}