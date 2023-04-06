import 'package:app/firebase_options.dart';
import 'package:app/shared/network/local/cache_helper.dart';
import 'package:app/shared/network/remote/dio_helper.dart';
import 'package:app/shared/router/router.dart';
import 'package:app/shared/router/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //ToDo:~> Add Firebase ------------------------------------------------------>
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //ToDo:~> Add Services.... Dio, cache ------------------------------------------------------>
  DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //ToDo:~> Add Routes -------------------------------------------------------->
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.testRoute,
    );
  }
}
