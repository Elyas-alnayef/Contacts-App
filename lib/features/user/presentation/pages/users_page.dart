import 'package:contacts_app/core/constant/app_routes.dart';
import 'package:contacts_app/core/constant/app_strings.dart';
import 'package:contacts_app/core/hepres/toast.dart';
import 'package:contacts_app/core/widgets/page_title.dart';
import 'package:contacts_app/features/user/data/datasources/local_data_source.dart';
import 'package:contacts_app/features/user/data/datasources/remote_data_source.dart';
import 'package:contacts_app/features/user/data/repositories/user_repository_imp.dart';
import 'package:contacts_app/features/user/domain/usecases/delete_uer.dart';
import 'package:contacts_app/features/user/domain/usecases/get_all_users.dart';
import 'package:contacts_app/features/user/presentation/cubits/userscubit/users_cubit.dart';
import 'package:contacts_app/features/user/presentation/pages/user_information_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/drawer.dart';
import '../widgets/button_widget.dart';
import '../widgets/user_card_widget.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(
          deleteUserByIdUseCase: DeleteUserByIdUseCase(
              userRepository: UserRepositoryImpl(
                  userLocalDataSource: UserLocalDataSourceImpl(),
                  userRemoteDtatSource: UserRemoteDtatSourceImpl(dio: Dio()))),
          getAllUsersUseCase: GetAllUsersUseCase(
              userRepository: UserRepositoryImpl(
                  userLocalDataSource: UserLocalDataSourceImpl(),
                  userRemoteDtatSource: UserRemoteDtatSourceImpl(dio: Dio()))))
        ..fetchUsers(),
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: const AppBarWidget(),
        backgroundColor: Color(0xFFF7F7F7),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle(
                  title: "Home / Users ",
                ),
                Row(
                  children: [
                    Expanded(
                      child: BlocConsumer<UsersCubit, UsersState>(
                        listener: (context, state) {
                          if (state is UsersSuccesState) {
                            showToast("Successfuly deleted", Colors.green);
                          }
                        },
                        builder: (context, state) {
                          return UsersFeatureButton(
                            func: () {
                              if (state is UsersLoadedState) {
                                if (context
                                    .read<UsersCubit>()
                                    .deletelis
                                    .isNotEmpty) {
                                  context
                                      .read<UsersCubit>()
                                      .deleteusers(state.deleteList!);
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
                                            "You should select at least one user to delete "),
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
                      child: UsersFeatureButton(
                        func: () {
                          Navigator.of(context)
                              .popAndPushNamed(RoutesNames.inviteNewUser);
                        },
                        buttonColor: Color.fromRGBO(78, 115, 223, 1),
                        buttonName: "Invite New User",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(hintText: "Search"),
                ),
                usersListSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//userslist
Widget usersListSection(BuildContext context) {
  return BlocConsumer<UsersCubit, UsersState>(
    listener: (context, state) {
      if (state is UsersFailureState) {
        showToast(state.message, Colors.red);
        print(state.message);
      }
    },
    builder: (context, state) {
      if (state is UsersLoadedState) {
        return Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 24),
            padding: EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Colors.white,
            ),
            child: ListView.separated(
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return UserCard(
                    selectFunc: (user) {
                      context.read<UsersCubit>().deletelis.add(user.id);
                      context.read<UsersCubit>().userSelected();
                    },
                    user: state.users![index],
                    func: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            UserInformationPage(userId: state.users![index].id),
                      ));
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
                itemCount: state.users!.length));
      } else {
        return Container(
            margin: EdgeInsets.only(top: 50),
            child: Center(child: CircularProgressIndicator()));
      }
    },
  );
}
