import 'package:equatable/equatable.dart';

abstract class SecurityEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCodeEvent extends SecurityEvents {
  final String? email;
  GetCodeEvent({
    required this.email,
  });
  @override
  List<Object?> get props => [email];
}

class ResetPassEvent extends SecurityEvents {
  final Map data;
  final bool isprofile;
  ResetPassEvent({required this.data, required this.isprofile});
  @override
  List<Object?> get props => [data, isprofile];
}
