import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'user_infromation_state.dart';

class UserInfromationCubit extends Cubit<UserInfromationState> {
  UserInfromationCubit() : super(UserInfromationInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  void backToPrevious(context) {
    Navigator.pop(context);
  }
  
}
