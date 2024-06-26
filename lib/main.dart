import 'package:contacts_app/core/constant/app_routes.dart';
import 'package:contacts_app/core/utils/shared_perferances_service.dart';
import 'package:contacts_app/features/auth/domain/usecases/user_login.dart';
import 'package:contacts_app/features/auth/domain/usecases/user_signup.dart';
import 'package:contacts_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:contacts_app/features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:contacts_app/features/auth/presentation/pages/login_page.dart';
import 'package:contacts_app/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/api_auth_service.dart';

import 'features/auth/data/datasources/auth_local_data_source.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';

void main() async {
  // await Hive.initFlutter();
  // Hive.registerAdapter(UserEntityAdapter());
  // await Hive.openBox('AuthenticatedUser');
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(UserLogInUseCase(
              authRepository: AuthRepositoryImpl(
                  authRemoteDataSource:
                      AuthRemoteDataSourceImp(apiService: ApiService(Dio())),
                  authLocalDataSource: AuthLocalDataSourceImp()))),
        ),
        BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(UserSignUp(
                authRepository: AuthRepositoryImpl(
                    authLocalDataSource: AuthLocalDataSourceImp(),
                    authRemoteDataSource: AuthRemoteDataSourceImp(
                        apiService: ApiService(Dio()))))))
      ],
      child: MaterialApp(
        routes: routes,
        title: 'Contact Book',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LogInPage(),
      ),
    );
  }
}








//  ApiService apiService = ApiService(new Dio());
//   try {
//     var data = await apiService.signUp(
//         companyName: "123",
//         city: "Azaz",
//         country: "Syria",
//         phoneNumber: "0531467889",
//         state: 'ff',
//         streetOne: "Q1-R3",
//         vatNumber: '12456789',
//         zip: '00000',
//         firstName: "saad",
//         lastName: "saad",
//         endPoint: "register",
//         email: "saad@gmail.com",
//         password: "123456789ASD");
//     print("--------------");
//     print(data);
//   } catch (e) {
//     if (e is DioException) {
//       print(e);
//     }
//   }




// await SharedPrefs.init();
//   ApiService apiService = ApiService(Dio());
//   try {
//     var data = await apiService.logIn(
//         endPoint: "login", email: "saad@gmail.com", password: "123456789ASD");
//     print(data);
//   } catch (e) {
//     if (e is DioException) {
//       print(e);
//     }
//   }
//     var x = await SharedPrefs.getData("token");
//     print(x);