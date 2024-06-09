import 'package:contacts_app/features/auth/presentation/pages/login_page.dart';
import 'package:contacts_app/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'features/auth/domain/entities/user_entity.dart';

void main() async {
  Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  await Hive.openBox('AuthenticatedUser');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/signup': (context) => SignUpPage()},
      title: 'Contact Book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LogInPage(),
    );
  }
}

// await SharedPrefs.init();
// ApiService apiService = ApiService(new Dio());
// var data = await apiService.signUp(
//     companyName: "SAPPRO",
//     city: "Azaz",
//     country: "Syria",
//     phoneNumber: "0531467889",
//     state: 'ff',
//     streetOne: "Q1-R3",
//     vatNumber: '12456789',
//     zip: '00000',
//     firstName: "Naser",
//     lastName: "naser",
//     endPoint: "register",
//     email: "Naser@gmail.com",
//     password: "123456789ASD");
// print(data);
// var x = await SharedPrefs.getData("token");
// print(x);
