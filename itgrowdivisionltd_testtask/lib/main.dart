import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:itgrowdivisionltd_testtask/pages/login.dart';
import 'package:itgrowdivisionltd_testtask/provider/data_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProvider()),
      ],
      child: MaterialApp(
        title: 'Test Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}

