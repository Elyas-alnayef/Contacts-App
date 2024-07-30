import 'package:bloc/bloc.dart';
import 'package:contacts_app/features/contacts/domain/entities/contact_entity.dart';
import 'package:contacts_app/features/contacts/domain/usecases/delete_contact_by_id.dart';
import 'package:contacts_app/features/contacts/domain/usecases/toggle_favoritre.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/get_all_contacts.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  final GetALlContactsUseCase getALlContactsUseCase;
  final DeleteContactByIdUseCase deleteContactByIdUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;
  List<String> deletelis = [];

  ContactsCubit(
      {required this.toggleFavoriteUseCase,
      required this.getALlContactsUseCase,
      required this.deleteContactByIdUseCase})
      : super(ContactsInitialState());
  Future<void> getContacts() async {
    emit(ContactsInitialState());
    Duration(milliseconds: 1500);
    var data = await getALlContactsUseCase.call();
    data.fold(
        (l) => emit(
            ContactsFailureState(message: l.message ?? "something went wrong")),
        (r) => emit(ContactsLoadedState(
            contacts: r, deleteList: [], deletedSuccessfully: false)));
  }

  Future<void> deleteSelectedContacts(List<String> contactsIds) async {
    try {
      var response;
      for (var contactid in contactsIds) {
        response = await deleteContactByIdUseCase.call(contactid);
      }
      deletelis.clear();
      emit((state as ContactsLoadedState)
          .copyWith(deletedSuccessfully: true, deleteList: []));
    } catch (e) {
      emit(ContactsFailureState(message: e.toString()));
    }
    getContacts();
  }

  Future<void> toggleContatcFavorite({required String contactId}) async {
    var data = await toggleFavoriteUseCase.call(contactId);

    data.fold((l) => emit(ContactsFailureState(message: l.message)),
        (r) => emit((state as ContactsLoadedState).copyWith()));
  }

  void addTodeleteList() {
    emit((state as ContactsLoadedState).copyWith(deleteList: deletelis));
  }
}
