part of 'contacts_cubit.dart';

@immutable
sealed class ContactsState {}

final class ContactsInitialState extends ContactsState {}

final class ContactsLoadedState extends ContactsState {
  final List<ContactEntity>? contacts;
  final List<String>? deleteList;
  final bool deletedSuccessfully;

  ContactsLoadedState(
      {required this.deletedSuccessfully,
      required this.contacts,
      required this.deleteList});
  ContactsLoadedState copyWith(
      {List<ContactEntity>? contacts,
      List<String>? deleteList,
      bool? deletedSuccessfully}) {
    return ContactsLoadedState(
        deletedSuccessfully: deletedSuccessfully ?? this.deletedSuccessfully,
        contacts: contacts ?? this.contacts,
        deleteList: deleteList ?? this.deleteList);
  }

}

final class ContactsFailureState extends ContactsState {
  final String message;

  ContactsFailureState({required this.message});
}

final class ContactsSuccesState extends ContactsState {
  final String message;
  ContactsSuccesState(this.message);
}
