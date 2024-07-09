import 'package:bloc/bloc.dart';
import 'package:contacts_app/features/user/domain/repositoies/user_repository.dart';
import 'package:contacts_app/features/user/domain/usecases/create_new_user.dart';
import 'package:flutter/material.dart';

part 'invite_new_user_state.dart';

class InviteNewUserCubit extends Cubit<InviteNewUserState> {
  final CreateNewUserUseCase createNewUserUseCase;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool isLooked = false;
  InviteNewUserCubit({required this.createNewUserUseCase})
      : super(InviteNewUserInitialState());
  void backToPrevious(context) {
    Navigator.pop(context);
  }

  Future<void> inviteNewUser(
      {required CreateNewUserUseCaseParams params}) async {
    try {
      var response = await createNewUserUseCase.call(params);
      emit(InviteNewUserSuccessState());
    } catch (e) {
      emit(InviteNewUserFailureState(message: e.toString()));
    }
  }

  void emailVauleChanged() {
    if (state is InviteNewUserLoadedState) {
      emit((state as InviteNewUserLoadedState)
          .copyWith(email: emailController.text));
    } else {
      emit(InviteNewUserLoadedState(email: emailController.text));
    }
  }

  void firstNameVauleChanged() {
    if (state is InviteNewUserLoadedState) {
      emit((state as InviteNewUserLoadedState)
          .copyWith(firstName: firstNameController.text));
    } else {
      emit(InviteNewUserLoadedState(firstName: firstNameController.text));
    }
  }

  void lastNameVauleChanged() {
    if (state is InviteNewUserLoadedState) {
      emit((state as InviteNewUserLoadedState)
          .copyWith(lastName: lastNameController.text));
    } else {
      emit(InviteNewUserLoadedState(lastName: lastNameController.text));
    }
  }

  void userTypeVauleChanged(
    String newvalue,
  ) {
    if (state is InviteNewUserLoadedState) {
      emit((state as InviteNewUserLoadedState).copyWith(userType: newvalue));
    } else {
      emit(InviteNewUserLoadedState(userType: newvalue));
    }
  }

  void phoneVauleChanged() {
    if (state is InviteNewUserLoadedState) {
      emit((state as InviteNewUserLoadedState)
          .copyWith(phoneNumber: phoneNumberController.text));
    } else {
      emit(InviteNewUserLoadedState(phoneNumber: phoneNumberController.text));
    }
  }

  void togglerChanged(bool current) {
    if (state is InviteNewUserLoadedState) {
      emit((state as InviteNewUserLoadedState).copyWith(isUnlooked: !current));
    } else {
      emit(InviteNewUserLoadedState(isUnlooked: isLooked));
    }
  }
}
