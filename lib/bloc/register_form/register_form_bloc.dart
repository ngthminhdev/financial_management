import 'package:financial_management/bloc/register_form/register_form_event.dart';
import 'package:financial_management/bloc/register_form/register_form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
	RegisterFormBloc(): super(RegisterFormInitial());

	Stream<RegisterFormState> mapEventToState(RegisterFormEvent event) async* {
		if (event is RegisterFormSubmitEvent) {
			yield RegisterFormInitial();

			await Future.delayed(const Duration(seconds: 2));



		}
	}
}
