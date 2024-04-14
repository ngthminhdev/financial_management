import 'dart:convert';

class User {
  String id;
  String accountName;
  String username;
  String email;
  String? phone;
  String? avatar;
  int role;
  int status;
  int memberShipType;
  int configStartDate;
  List<String>? permissions;
  String createdAt;
  String modifiedAt;
  String accessToken;

  User({
    required this.id,
    required this.accountName,
    required this.username,
    required this.email,
    this.phone,
    this.avatar,
    required this.role,
    required this.status,
    required this.memberShipType,
    required this.configStartDate,
    this.permissions,
    required this.createdAt,
    required this.modifiedAt,
    required this.accessToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        accountName: json['account_name'],
        username: json['user_name'],
        email: json['email'],
        phone: json['phone'],
        avatar: json['avatar'],
        role: json['role'],
        status: json['status'],
        permissions: json['permissions'] ?? [],
        memberShipType: json['member_ship_type'],
        configStartDate: json['config_start_date'],
        createdAt: json['created_at'],
        modifiedAt: json['modified_at'],
        accessToken: json['access_token']);
  }

  toJson() {
    return {
      'id': id,
      'account_name': accountName,
      'user_name': username,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'role': role,
      'status': status,
      'permissions': permissions,
      'member_ship_type': memberShipType,
      'config_start_date': configStartDate,
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'access_token': accessToken,
    };
  }
}
