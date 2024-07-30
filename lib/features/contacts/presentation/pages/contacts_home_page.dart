import 'package:contacts_app/core/constant/app_routes.dart';
import 'package:contacts_app/core/hepres/toast.dart';
import 'package:contacts_app/features/contacts/data/datasources/contact_local_data_source.dart';
import 'package:contacts_app/features/contacts/data/datasources/contact_remote_data_source.dart';
import 'package:contacts_app/features/contacts/data/repositories/contact_repository_imp.dart';
import 'package:contacts_app/features/contacts/domain/entities/contact_entity.dart';
import 'package:contacts_app/features/contacts/domain/usecases/delete_contact_by_id.dart';
import 'package:contacts_app/features/contacts/domain/usecases/get_all_contacts.dart';
import 'package:contacts_app/features/contacts/domain/usecases/toggle_favoritre.dart';
import 'package:contacts_app/features/contacts/presentation/cubits/contactscubit/contacts_cubit.dart';
import 'package:contacts_app/features/contacts/presentation/pages/contact_profile_page.dart';
import 'package:contacts_app/features/contacts/presentation/widgets/conatct_card.dart';
import 'package:contacts_app/features/user/domain/entities/user_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/drawer.dart';
import '../../../../core/widgets/page_title.dart';
import '../../../user/presentation/widgets/button_widget.dart';
import '../../../user/presentation/widgets/user_card_widget.dart';

class ContactsHome extends StatelessWidget {
  const ContactsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactsCubit(
          toggleFavoriteUseCase: ToggleFavoriteUseCase(
              contactRepository: ContactRepositoryImpl(
                  contactLoaclDataSource: ContactLoaclDataSource(),
                  contactRemoteDataSource:
                      ContactRemoteDataSourceImpl(dio: Dio()))),
          deleteContactByIdUseCase: DeleteContactByIdUseCase(
              contactRepository: ContactRepositoryImpl(
                  contactLoaclDataSource: ContactLoaclDataSource(),
                  contactRemoteDataSource:
                      ContactRemoteDataSourceImpl(dio: Dio()))),
          getALlContactsUseCase: GetALlContactsUseCase(
              contactRepository: ContactRepositoryImpl(
                  contactLoaclDataSource: ContactLoaclDataSource(),
                  contactRemoteDataSource:
                      ContactRemoteDataSourceImpl(dio: Dio()))))
        ..getContacts(),
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: const AppBarWidget(),
        backgroundColor: Color(0xFFF7F7F7),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                PageTitle(
                  title: "Home / Contacts ",
                ),
                UsersFeatureButton(
                  func: () {
                    Navigator.of(context)
                        .pushNamed(RoutesNames.createNewContact);
                  },
                  buttonColor: Color.fromRGBO(40, 167, 69, 1),
                  buttonName: "Create New",
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: BlocConsumer<ContactsCubit, ContactsState>(
                        listener: (context, state) {
                          if (state is ContactsLoadedState &&
                              state.deletedSuccessfully == true) {
                            showToast("Successfuly deleted", Colors.green);
                          } else if (state is ContactsFailureState) {
                            print(state.message);
                          }
                        },
                        builder: (context, state) {
                          return UsersFeatureButton(
                            func: () {
                              if (state is ContactsLoadedState) {
                                if (context
                                    .read<ContactsCubit>()
                                    .deletelis
                                    .isNotEmpty) {
                                  context
                                      .read<ContactsCubit>()
                                      .deleteSelectedContacts(
                                          state.deleteList!);
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Center(child: Text("OK")))
                                        ],
                                        content: Text(
                                            "You should select at least one contact to delete "),
                                      );
                                    },
                                  );
                                }
                              }
                            },
                            buttonColor: Color.fromRGBO(252, 118, 106, 1),
                            buttonName: AppStrings.delete,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: PopupMenuButton(
                          constraints: BoxConstraints(maxWidth: 154),
                          offset: Offset(0, 48),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                  child: TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(RoutesNames.sendEmail);
                                },
                                child: Text(
                                  "Send via Email",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              )),
                              PopupMenuItem(
                                  child: TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(RoutesNames.exportToPDF);
                                },
                                child: Text(
                                  "PDF File",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              )),
                            ];
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(AppStrings.exportTo,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color.fromRGBO(78, 115, 223, 1)),
                            height: 48,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(hintText: "Search"),
                ),
                contactsListSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//contacts
Widget contactsListSection(BuildContext context) {
  return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 24),
      padding: EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
      ),
      child: BlocConsumer<ContactsCubit, ContactsState>(
        listener: (context, state) {
          if (state is ContactsFailureState) {
            showToast(state.message, Colors.red);
          }
        },
        builder: (context, state) {
          if (state is ContactsLoadedState) {
            return ListView.separated(
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ContactCard(
                    toggleFav: () {
                      state.contacts![index].isFavorite = !state.contacts![index].isFavorite;
                      context.read<ContactsCubit>().toggleContatcFavorite(
                          contactId: state.contacts![index].id.toString());
                      print(state.contacts![index].isFavorite);
                    },
                    selectFunc: (contact) {
                      context
                          .read<ContactsCubit>()
                          .deletelis
                          .add(contact.id.toString());
                      context.read<ContactsCubit>().addTodeleteList();
                    },
                    contact: ContactEntity(
                      phoneNumber2: state.contacts![index].phoneNumber2,
                      imageUrl: state.contacts![index].imageUrl,
                      email2: state.contacts![index].email2,
                      address2: state.contacts![index].address2,
                      address1: state.contacts![index].address1,
                      isFavorite: state.contacts![index].isFavorite,
                      isActive: state.contacts![index].isActive,
                      id: state.contacts![index].id,
                      firstName: state.contacts![index].firstName,
                      lastName: state.contacts![index].lastName,
                      email1: state.contacts![index].email1,
                      phoneNumber1: state.contacts![index].phoneNumber1,
                    ),
                    func: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ContactProfilePage(
                            contactId: state.contacts![index].id),
                      ));
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
                itemCount: state.contacts!.length);
          } else {
            return Container(
                margin: EdgeInsets.only(top: 50),
                child: Center(child: CircularProgressIndicator()));
          }
        },
      ));
}
