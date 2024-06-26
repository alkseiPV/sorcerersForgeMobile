// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String? name;
  final String? surname;
  final String? patronymic;
  final String? contact;
  const ProfileModel({this.contact, this.name, this.patronymic, this.surname});
  @override
  List<Object?> get props => [
        contact,
        surname,
        name,
        patronymic,
      ];

  ProfileModel copyWith({
    int? id,
    int? user_id,
    String? name,
    String? surname,
    String? patronymic,
    String? contact,
    String? photo,
  }) {
    return ProfileModel(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      patronymic: patronymic ?? this.patronymic,
      contact: contact ?? this.contact,
    );
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      patronymic: json['patronymic'] as String?,
      contact: json['contact'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'patronymic': patronymic,
      'contact': contact
    };
  }
}
