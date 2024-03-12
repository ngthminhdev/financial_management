import 'package:equatable/equatable.dart';

abstract class RegisterFormState extends Equatable {
	const RegisterFormState();

	@override
	List<Object> get props => [];
}

class RegisterFormInitial extends RegisterFormState {}

class RegisterFormLoading extends RegisterFormState {}

class RegisterFormSuccess extends RegisterFormState {}

class RegisterFormError extends RegisterFormState {
	final String error;
	
	const RegisterFormError({required this.error});

	@override
	List<Object> get props => [error];
}
