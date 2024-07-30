import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:contacts_app/features/contacts/domain/repositories/contatc_repository.dart';
import 'package:contacts_app/features/contacts/domain/usecases/create_new_conatct.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'create_new_contact_state.dart';

class CreateNewContactCubit extends Cubit<CreateNewContactState> {
  final CreateNewContatcUseCase createNewContatcUseCase;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController emailTwoController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController phoneNumberTwoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController addressTwoController = TextEditingController();

  CreateNewContactCubit({required this.createNewContatcUseCase})
      : super(CreateNewContactInitialState());
  Future<void> createContact({required CreateNewContactUseCaseParams params}) async {
    var data = await createNewContatcUseCase.call(params);
    data.fold((l) => emit(CreateNewContactFailureState(message: l.message)),
        (r) => emit(CreateNewContactSuccesState("Created Successfully")));
  }

  void imageSelected(XFile image) {
    if (state is CreateNewContactInitialState) {
      emit((state as CreateNewContactInitialState).copyWith(image: image));
    } else {
      emit(CreateNewContactInitialState(image: image));
    }
  }

  void firstNameVauleChanged() {
    if (state is CreateNewContactInitialState) {
      emit((state as CreateNewContactInitialState)
          .copyWith(firstName: firstNameController.text));
    } else {
      emit(CreateNewContactInitialState(firstName: firstNameController.text));
    }
  }

  void lastNameVauleChanged() {
    if (state is CreateNewContactInitialState) {
      emit((state as CreateNewContactInitialState)
          .copyWith(lastName: lastNameController.text));
    } else {
      emit(CreateNewContactInitialState(lastName: lastNameController.text));
    }
  }

  void emailVauleChanged() {
    if (state is CreateNewContactInitialState) {
      emit((state as CreateNewContactInitialState)
          .copyWith(email: emailController.text));
    } else {
      emit(CreateNewContactInitialState(email: emailController.text));
    }
  }

  void emailTwoVauleChanged() {
    if (state is CreateNewContactInitialState) {
      emit((state as CreateNewContactInitialState)
          .copyWith(emailTwo: emailTwoController.text));
    } else {
      emit(CreateNewContactInitialState(emailTwo: emailTwoController.text));
    }
  }

  void phoneVauleChanged() {
    if (state is CreateNewContactInitialState) {
      emit((state as CreateNewContactInitialState)
          .copyWith(phoneNumber: phoneNumberController.text));
    } else {
      emit(CreateNewContactInitialState(
          phoneNumber: phoneNumberController.text));
    }
  }

  void mobileNumberVauleChanged() {
    if (state is CreateNewContactInitialState) {
      emit((state as CreateNewContactInitialState)
          .copyWith(mobileNumber: phoneNumberTwoController.text));
    } else {
      emit(CreateNewContactInitialState(
          mobileNumber: phoneNumberTwoController.text));
    }
  }

  void addressVauleChanged() {
    if (state is CreateNewContactInitialState) {
      emit((state as CreateNewContactInitialState)
          .copyWith(address: addressController.text));
    } else {
      emit(CreateNewContactInitialState(address: addressController.text));
    }
  }

  void addressTwoVauleChanged() {
    if (state is CreateNewContactInitialState) {
      emit((state as CreateNewContactInitialState)
          .copyWith(addressTwo: addressTwoController.text));
    } else {
      emit(CreateNewContactInitialState(addressTwo: addressTwoController.text));
    }
  }
}
