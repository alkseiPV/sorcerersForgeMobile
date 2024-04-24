import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? email;

  const UserModel({this.id, this.email});

  @override
  List<Object?> get props => [id, email];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }

  UserModel copyWith({
    int? id,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }
}
