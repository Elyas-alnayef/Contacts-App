import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../domain/repositories/company_repository.dart';
import '../../../domain/usecases/edit_company_informayion.dart';
import '../../../domain/usecases/get_company_information.dart';
part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final GetCompanyInformationUseCase getCompanyInformationUseCase;
  final EditCompanyInformationUseCase editCompanyInformationUseCase;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController vatController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController street2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  String companyName = "";
  bool isEditingMode = false;

  CompanyCubit(
      this.getCompanyInformationUseCase, this.editCompanyInformationUseCase)
      : super(CompanyInitial());
  Future<void> getCompanyInfomation() async {
    emit(CompanyLoadingState());
    var result = await getCompanyInformationUseCase.call();
    result.fold((error) {
      emit(LoadingCompanyFailerState(message: error.message));
    }, (response) {
      emit(CompanyLoadedState(company: response));
    });
  }

  void backToPrevious(context) {
    Navigator.of(context).pop();
  }

  Future<void> onSaveChages(
      EditCompanyUseCaseParameters params) async {
    emit(CompanyLoadingState());
    Duration(milliseconds: 1500);
    var result = await editCompanyInformationUseCase.call(params);
    result.fold((error) {
      emit(LoadingCompanyFailerState(message: error.message));
    }, (response) {
      emit((CompanyLoadedState(company: response)));
    });
    isEditingMode = false;
    emit(SavedState());
  }

  void onEditMode() {
    isEditingMode = true;
    emit(CompanyEnableFormState(enableform: true));
  }

  void companyNameTextFieldChanged() {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(companyName: companyNameController.text));
    } else {
      emit(TextFieldChangedCompleteState(
          companyName: companyNameController.text));
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
}
