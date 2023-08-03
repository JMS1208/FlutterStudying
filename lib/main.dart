import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_studying/page/home.dart';
import 'package:for_studying/page/search.dart';
import 'package:for_studying/repository/search_repository.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as groute;

import 'bloc/search_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      getPages: [
        GetPage(
          name: "/home",
          page: ()=> HomePage(),
          transition: groute.Transition.rightToLeftWithFade,
          transitionDuration: Duration(milliseconds: 1000)
        ),
        GetPage(
          name: "/search",
          page: ()=> RepositoryProvider(
            create: (context)=> SearchRepository(),
            child: BlocProvider(
              create: (context)=> SearchBloc(context.read<SearchRepository>()),
              child: SearchPage()
            )
          ),
          transition: groute.Transition.rightToLeftWithFade,
          transitionDuration: Duration(milliseconds: 1000)
        )
      ],
    );
  }
}

