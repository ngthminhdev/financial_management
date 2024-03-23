class CategoryModel {
  final String id;
  final String name;
  final int icon;
  final int status;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.icon,
      required this.status});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      status: json['status'] ?? CATEGORY_ACTIVE,
    );
  }
}

const CATEGORY_INACTIVE = 0;
const CATEGORY_ACTIVE = 1;
