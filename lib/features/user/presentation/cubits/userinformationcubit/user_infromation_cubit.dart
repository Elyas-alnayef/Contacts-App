import 'package:bloc/bloc.dart';
import 'package:contacts_app/core/constant/app_routes.dart';
import 'package:contacts_app/features/user/domain/entities/user_entity.dart';
import 'package:contacts_app/features/user/domain/repositoies/user_repository.dart';
import 'package:contacts_app/features/user/domain/usecases/get_user_information.dart';
import 'package:contacts_app/features/user/domain/usecases/update_user_infomation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'user_infromation_state.dart';

class UserInfromationCubit extends Cubit<UserInfromationState> {
  final GetUserInformationByIdUseCase getUserInformationByIdUseCase;
  final UpdateUserInformationUserCase updateUserInformationUserCase;

  UserInfromationCubit({
    required this.getUserInformationByIdUseCase,
    required this.updateUserInformationUserCase,
  }) : super(UserInfromationInitialState());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool islooked = true;

  void backToPrevious(context) {
    Navigator.pushReplacementNamed(context, RoutesNames.users);
  }

  Future<void> fetchUserById({required String userId}) async {
    var data = await getUserInformationByIdUseCase.call(userId);
    data.fold(
        (error) => emit(UserInfromationFailureState(message: error.message)),
        (data) {
      emailController.text = data.email;
      firstNameController.text = data.firstName;
      lastNameController.text = data.lastName;
      phoneNumberController.text = data.phoneNumber;

      emit(
        UserInfromationLoadedState(
          user: data,
          userType: data.role,
        ),
      );
    });
  }

  void togglerChanged(bool current) {
    if (state is UserInfromationLoadedState) {
      emit(
          (state as UserInfromationLoadedState).copyWith(isUnlooked: !current));
    } else {
      emit(UserInfromationLoadedState(isUnlooked: islooked));
    }
  }

  void emailChanged() {
    if (state is UserInfromationLoadedState) {
      emit((state as UserInfromationLoadedState)
          .copyWith(email: emailController.text));
    } else {
      emit(UserInfromationLoadedState(isUnlooked: islooked));
    }
  }

  void firstNameChanged() {
    if (state is UserInfromationLoadedState) {
      emit((state as UserInfromationLoadedState)
          .copyWith(firstName: firstNameController.text));
    } else {
      emit(UserInfromationLoadedState(isUnlooked: islooked));
    }
  }

  void lastNameChanged() {
    if (state is UserInfromationLoadedState) {
      emit((state as UserInfromationLoadedState)
          .copyWith(lastName: lastNameController.text));
    } else {
      emit(UserInfromationLoadedState(lastName: lastNameController.text));
    }
  }

  void phoneNumberChanged() {
    if (state is UserInfromationLoadedState) {
      emit((state as UserInfromationLoadedState)
          .copyWith(phoneNumber: phoneNumberController.text));
    } else {
      emit(UserInfromationLoadedState(phoneNumber: phoneNumberController.text));
    }
  }

  void userTypeChanged(String selectedValue) {
    if (state is UserInfromationLoadedState) {
      emit((state as UserInfromationLoadedState)
          .copyWith(userType: selectedValue));
    } else {
      emit(UserInfromationLoadedState(userType: selectedValue));
    }
  }

  void enableEditing() {
    if (state is UserInfromationLoadedState) {
      emit((state as UserInfromationLoadedState).copyWith(isReadOnly: false));
    } else {
      emit(UserInfromationLoadedState(isReadOnly: false));
    }
  }

  Future<void> updateUserInfomation(
      UpdateUserInformationUseCaseParams params) async {
    var response = await updateUserInformationUserCase.call(params);
    response.fold(
        (error) => emit(UserInfromationFailureState(message: error.message)),
        (data) => emit(UserInfromationSuccessSatet(message: "User Updated")));
  }
}
