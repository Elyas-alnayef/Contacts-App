import 'package:bloc/bloc.dart';
import 'package:contacts_app/features/auth/domain/usecases/user_signup.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../domain/repositories/auth_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final UserSignUp signUpUseCase;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController vatController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController street2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  String countryName = '';
  bool isPasswordshown = false;
  IconData suffixPasswordIcon = Icons.visibility_off;

  SignupCubit(this.signUpUseCase) : super(SignupInitial());
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    companyNameController.dispose();
    vatController.dispose();
    streetController.dispose();
    street2Controller.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
  }

  void chagePasswordVisibility() {
    isPasswordshown = !isPasswordshown;
    suffixPasswordIcon =
        isPasswordshown ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordSuffixIconSate());
  }

void passwordTextFieldChanged() {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(password: passwordController.text));
    } else {
      emit(TextFieldChangedCompleteState(password: passwordController.text));
    }
  }

  void emailTextFieldChanged() {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(email: emailController.text));
    } else {
      emit(TextFieldChangedCompleteState(email: emailController.text));
    }
  }
  void firstNameTextFieldChanged() {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(firstName: firstNameController.text));
    } else {
      emit(TextFieldChangedCompleteState(firstName: firstNameController.text));
    }
  } 
  void lastNameTextFieldChanged() {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(lastName: lastNameController.text));
    } else {
      emit(TextFieldChangedCompleteState(lastName: lastNameController.text));
    }
  }

void companyNameTextFieldChanged() {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(companyName: companyNameController.text));
    } else {
      emit(TextFieldChangedCompleteState(companyName: companyNameController.text));
    }
  }
  void vatTextFieldChanged() {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(vat: vatController.text));
    } else {
      emit(TextFieldChangedCompleteState(vat: vatController.text));
    }
  }
  void street1TextFieldChanged() {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(street1: streetController.text));
    } else {
      emit(TextFieldChangedCompleteState(street1: streetController.text));
    }
  }
  void street2TextFieldChanged() {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(street2: street2Controller.text));
    } else {
      emit(TextFieldChangedCompleteState(street2: street2Controller.text));
    }
  }
 void zipTextFieldChanged() {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(zip: zipController.text));
    } else {
      emit(TextFieldChangedCompleteState(zip: zipController.text));
    }
  }
 void stateTextFieldChanged() {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(state: stateController.text));
    } else {
      emit(TextFieldChangedCompleteState(state: stateController.text));
    }
  }
 void cityTextFieldChanged() {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(city: cityController.text));
    } else {
      emit(TextFieldChangedCompleteState(city: cityController.text));
    }
  }
 void countryNameSelected(String country) {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(countryName: country));
    } else {
      emit(TextFieldChangedCompleteState(countryName: country));
    }
  }


  Future<void> signUp(SignUpUseCaseParameters params) async {
    emit(RegisterLoading());
    Duration(milliseconds: 1500);
    var result = await signUpUseCase.call(params);
    result.fold((error) {
      emit(RegisteFaild(message: error.message));
    }, (response) {
      emit(RegisterSuccess(message: response));
    });
  }
}
