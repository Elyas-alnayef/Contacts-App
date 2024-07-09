import 'package:bloc/bloc.dart';
import 'package:contacts_app/core/constant/app_routes.dart';
import 'package:contacts_app/features/user/domain/entities/user_entity.dart';
import 'package:contacts_app/features/user/domain/usecases/get_all_users.dart';
import 'package:flutter/material.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final GetAllUsersUseCase getAllUsersUseCase;
  UsersCubit({required this.getAllUsersUseCase}) : super(UsersInitialState());

  Future<void> fetchUsers() async {
    emit(UsersInitialState());
    Duration(milliseconds: 1500);
    var data = await getAllUsersUseCase.call();
    data.fold((error) {
      emit(UsersFailureState(message: error.message));
    }, (response) {
      emit(UsersLoadedState(users: response));
    });
  }
}
