import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qureos/authentication/authentication_cubit.dart';
import 'package:flutter_qureos/routes/custom_routes.dart';
import 'package:flutter_qureos/routes/routes_names.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationCubit>(create: (context) => AuthenticationCubit())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loot',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.deepPurple,
      ),
      onGenerateRoute: CustomRoutes.allRoutes,
      initialRoute: login,
      // home: FormThree(),
      // home: LatestDeals(),
    );
  }
}