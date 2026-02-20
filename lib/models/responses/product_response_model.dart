import 'dart:convert';

class ProductResponseModel {
  String? status;
  List<Product>? data;

  ProductResponseModel({this.status, this.data});

  ProductResponseModel copyWith({String? status, List<Product>? data}) =>
      ProductResponseModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory ProductResponseModel.fromJson(String str) =>
      ProductResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductResponseModel.fromMap(Map<String, dynamic> json) =>
      ProductResponseModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Product {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stock;
  int? categoryId;
  String? image;
  String? status;
  String? criteria;
  int? favorite;
  DateTime? createdAt;
  DateTime? updatedAt;
  Category? category;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stock,
    this.categoryId,
    this.image,
    this.status,
    this.criteria,
    this.favorite,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  Product copyWith({
    int? id,
    String? name,
    String? description,
    int? price,
    int? stock,
    int? categoryId,
    String? image,
    String? status,
    String? criteria,
    int? favorite,
    DateTime? createdAt,
    DateTime? updatedAt,
    Category? category,
  }) => Product(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    price: price ?? this.price,
    stock: stock ?? this.stock,
    categoryId: categoryId ?? this.categoryId,
    image: image ?? this.image,
    status: status ?? this.status,
    criteria: criteria ?? this.criteria,
    favorite: favorite ?? this.favorite,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    category: category ?? this.category,
  );

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    stock: json["stock"],
    categoryId: json["category_id"],
    image: json["image"],
    status: json["status"],
    criteria: json["criteria"],
    favorite: json["favorite"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    category: json["category"] == null
        ? null
        : Category.fromMap(json["category"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "stock": stock,
    "category_id": categoryId,
    "image": image,
    "status": status,
    "criteria": criteria,
    "favorite": favorite,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "category": category?.toMap(),
  };
}

class Category {
  int? id;
  String? name;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  Category copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Category(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
