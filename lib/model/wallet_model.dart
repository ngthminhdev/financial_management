import 'package:financial_management/constant/common_constant.dart';

class WalletModel {
  String? id;
  String? userId;
  String? name;
  double? balance;
  int? type;
  String? createdAt;
  String? modifiedAt;
  String? date;
  String? goatId;
  double? income;
  double? spent;

  WalletModel({
    this.id,
    this.userId,
    this.name,
    this.balance,
    this.type,
    this.createdAt,
    this.modifiedAt,
    this.date,
    this.goatId,
    this.income,
    this.spent,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        id: json['id'],
        userId: json['userId'],
        name: json['name'],
        balance: json['balance'] != null ? double.parse(json['balance']) : 0.0,
        type: json['type'] ?? WALLET_TYPE_DEFAULT,
        createdAt: json['createdAt'],
        modifiedAt: json['modifiedAt'],
        date: json['date'],
        goatId: json['goatId'],
        income: json['income'] != null ? double.parse(json['income']) : 0.0,
        spent: json['spent'] != null ? double.parse(json['spent']) : 0.0,
      );
}
