import 'package:bloc/bloc.dart';
import 'package:contacts_app/features/user/domain/entities/user_entity.dart';
import 'package:contacts_app/features/user/domain/usecases/delete_uer.dart';
import 'package:contacts_app/features/user/domain/usecases/get_all_users.dart';
import 'package:flutter/material.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final GetAllUsersUseCase getAllUsersUseCase;
  final DeleteUserByIdUseCase deleteUserByIdUseCase;
  List<String> deletelis = [];
  UsersCubit(
      {required this.deleteUserByIdUseCase, required this.getAllUsersUseCase})
      : super(UsersInitialState());

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

  void userSelected() {
    if (state is UsersLoadedState) {
      emit((state as UsersLoadedState).copyWith(deleteList: deletelis));
    }
  }

  Future<void> deleteusers(List<String> usersId) async {
    try {
      var response;
      for (var userId in usersId) {
        response = await deleteUserByIdUseCase.call(userId);
      }
      emit(UsersSuccesState(response.toString()));
    } catch (e) {
      emit(UsersFailureState(message: e.toString()));
    }
    fetchUsers();
  }
}
