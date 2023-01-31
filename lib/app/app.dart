

import 'package:flutter/material.dart';
import 'package:todoapp/resources/routes_manager.dart';
import 'package:todoapp/resources/theme_manager.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.loginRoute,
        theme: getApplicationTheme(),
       // navigatorKey: NavigationService().navigationKey,
      
    );
  }
}