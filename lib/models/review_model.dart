import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final int id;
  final int productId;
  final int userId;
  final int stars;
  final String message;

  const ReviewModel({
    required this.id,
    required this.productId,
    required this.userId,
    required this.stars,
    required this.message,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] as int,
      productId: json['product_id'] as int,
      userId: json['user_id'] as int,
      stars: json['stars'] as int,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'user_id': userId,
      'stars': stars,
      'message': message,
    };
  }

  // Добавление метода copyWith
  ReviewModel copyWith({
    int? id,
    int? productId,
    int? userId,
    int? stars,
    String? message,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      userId: userId ?? this.userId,
      stars: stars ?? this.stars,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [id, productId, userId, stars, message];
}
