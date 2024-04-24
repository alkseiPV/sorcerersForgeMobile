// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final double? price;
  final double? reviews_mid;
  final double? reviews_count;
  final int? quantity;
  final int? work_time;
  final String? photo;
  final int? category_id;
  final bool? is_active;
  const ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.reviews_mid,
    this.reviews_count,
    this.quantity,
    this.work_time,
    this.photo,
    this.category_id,
    this.is_active,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        reviews_mid,
        reviews_count,
        quantity,
        work_time,
        photo,
        category_id,
        is_active
      ];

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: double.parse(json['price'].toString()),
      reviews_mid: double.parse(json['reviews_mid'].toString()),
      reviews_count: double.parse(json['reviews_count'].toString()),
      quantity: json['quantity'] as int?,
      work_time: json['work_time'] as int?,
      photo: json['photo'] as String?,
      category_id: json['category_id'] as int?,
      is_active: json['is_active'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'reviews_mid': reviews_mid,
      'reviews_count': reviews_count,
      'quantity': quantity,
      'work_time': work_time,
      'photo': photo,
      'category_id': category_id,
      'is_active': is_active,
    };
  }

  ProductModel copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    double? reviews_mid,
    double? reviews_count,
    int? quantity,
    int? work_time,
    String? photo,
    int? category_id,
    bool? is_active,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      reviews_mid: reviews_mid ?? this.reviews_mid,
      reviews_count: reviews_count ?? this.reviews_count,
      quantity: quantity ?? this.quantity,
      work_time: work_time ?? this.work_time,
      photo: photo ?? this.photo,
      category_id: category_id ?? this.category_id,
      is_active: is_active ?? this.is_active,
    );
  }
}
