import 'package:contacts_app/core/constant/app_routes.dart';
import 'package:contacts_app/core/utils/api_company_service.dart';
import 'package:contacts_app/core/utils/hive_service.dart';
import 'package:contacts_app/core/utils/shared_perferances_service.dart';
import 'package:contacts_app/features/auth/domain/usecases/user_login.dart';
import 'package:contacts_app/features/auth/domain/usecases/user_signup.dart';
import 'package:contacts_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:contacts_app/features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:contacts_app/features/auth/presentation/pages/login_page.dart';
import 'package:contacts_app/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:contacts_app/features/company/data/datasources/company_local_data_source.dart';
import 'package:contacts_app/features/company/data/datasources/company_remote_data_source.dart';
import 'package:contacts_app/features/company/data/repositories/company_repository_imp.dart';
import 'package:contacts_app/features/company/domain/usecases/edit_company_informayion.dart';
import 'package:contacts_app/features/company/presentation/cubits/cubit/company_cubit.dart';
import 'package:contacts_app/features/home/presentation/pages/home_page.dart';
import 'package:contacts_app/features/user/domain/repositoies/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../../core/utils/api_auth_service.dart';
import 'features/auth/data/datasources/auth_local_data_source.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/company/domain/entities/company_entity.dart';
import 'features/company/domain/usecases/get_company_information.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  CompanyHiveServices.boxinit<CompanyEntity>(
      CompanyEntityAdapter(), "CompanyBox");
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
        BlocProvider<CompanyCubit>(
          create: (context) => CompanyCubit(
              GetCompanyInformationUseCase(
                companyRepository: CompanyRepositoryImpl(
                    companyRemoteDataSourceImpl: CompanyRemoteDataSourceImpl(
                        apiService: CompanyApiService(Dio())),
                    compayLocalDataSourceImpl: CompayLocalDataSourceImpl()),
              ),
              EditCompanyInformationUseCase(
                  companyRepository: CompanyRepositoryImpl(
                      companyRemoteDataSourceImpl: CompanyRemoteDataSourceImpl(
                          apiService: CompanyApiService(Dio())),
                      compayLocalDataSourceImpl: CompayLocalDataSourceImpl())))
            ..getCompanyInfomation(),
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
        home: SharedPrefs.getData("token") == null ? LogInPage() : HomePage(),
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





//user test
//
//
//
//create new user 
// var data = await userremote.createNewUser(
//       endPoint: "Users",
//       params: CreateNewUserUseCaseParams(
//           firstname: "hadee",
//           lastName: "Nayef",
//           email: "hadee@gmial.com",
//           phoneNumber: "576849457",
//           role: "User"),
//       token:
//           "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI0YTY0YTEyMi05ZDZkLTRlNDktYWMzYS1lYmQ5YjA5YTliMjkiLCJJZCI6ImNiMmQ5MGU1LTMxNGYtNDhjZC05YTBhLWVjOGQzNTNlMjhhOSIsIkNvbXBhbnlJZCI6IjE1OSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6Ik93bmVyIiwiZXhwIjoxNzIwNTI2OTI0LCJpc3MiOiIqIiwiYXVkIjoiKiJ9.Yig3iEtOJ93aPQjbKdR7OKvR50RD32qK28G75Qt_Ub4");






