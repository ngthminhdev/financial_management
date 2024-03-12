import 'package:equatable/equatable.dart';

abstract class RegisterFormEvent extends Equatable {
  const RegisterFormEvent();

  @override
  List<Object> get props => [];
}

class RegisterFormSubmitEvent extends RegisterFormEvent {
  final String accountName;
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterFormSubmitEvent({
    required this.accountName,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props =>
      [accountName, username, email, password, confirmPassword];
}
