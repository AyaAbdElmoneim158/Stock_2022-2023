import 'package:app/firebase_options.dart';
import 'package:app/modules/Design/Details/design_details.dart';
import 'package:app/modules/page_view.dart';
import 'package:app/modules/table_test.dart';

import 'package:app/shared/components/constants.dart';
import 'package:app/shared/cubit/bloc_observer.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/network/local/cache_helper.dart';
import 'package:app/shared/network/remote/dio_helper.dart';
import 'package:app/shared/router/router.dart';
import 'package:app/shared/router/routes.dart';
import 'package:app/shared/styles/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:app/modules/no_internet_page.dart';

// import 'package:flutter_localization/flutter_localization.dart';

///~> -----------------------------------------------

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //ToDo:~> Add Firebase ------------------------------------------------------>
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //ToDo:~> Add Services.... Dio, cache,Bloc --------------------------------------->
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //ToDo:~> Add BlocProvider ---------------------------------------------->
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        //ToDo: localizations ---------------------------------------------->
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          lang ? const Locale('ar', "AE") : const Locale('en'),
        ],
        //ToDo:~> Add Theme ----------------------------------------------------->
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,

        //ToDo:~> Add Routes ---------------------------------------------------->
        onGenerateRoute: onGenerate,
        initialRoute: AppRoutes.landingRoute,
        // home: NoInternetPage(),
      ),
    );
  }
}
/*import 'package:app/modules/test_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ], supportedLocales: [
      Locale('ar', "AE"),
    ], home: TestViewPage());
  }
}*/
