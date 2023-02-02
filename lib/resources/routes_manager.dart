import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/resources/strings_manager.dart';
import 'package:todoapp/ui/lobby/createTodo/create_todo_page.dart';
import 'package:todoapp/ui/lobby/createTodo/todo_provider.dart';
import 'package:todoapp/ui/lobby/todo_list.dart';
import 'package:todoapp/ui/lobby/todo_list_provider.dart';
import 'package:todoapp/ui/login/login_page.dart';
import 'package:todoapp/ui/login/login_provider.dart';
import 'package:todoapp/ui/signup/signup_provider.dart';
import 'package:todoapp/ui/signup/singup_page.dart';


class Routes {
  static const String initialRoute = "/";
  static const String loginRoute = "/login";
  static const String signInRoute = "/signIn";
  static const String lobbyRoute = "/lobby";
  static const String todoRoute = "/todo";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
     
      case Routes.loginRoute:
        return MaterialPageRoute(
            builder: (_) =>  ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(),
      child: const LoginPage()));
       case Routes.signInRoute:
        return MaterialPageRoute(
            builder: (_) =>  ChangeNotifierProvider<SignInProvider>(
      create: (context) => SignInProvider(),
      child: const SignInPage()));
     case Routes.lobbyRoute:
        return MaterialPageRoute(
            builder: (_) =>  ChangeNotifierProvider<LobbyProvider>(
      create: (context) => LobbyProvider(),
      child: const LobbyPage()));
      case Routes.todoRoute:
      Map<String, dynamic> arguments =
            routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) =>  ChangeNotifierProvider<TodoProvider>(
      create: (context) => TodoProvider(),
      child:  CreateTodoPage(
       todoTask: arguments["todoTask"],
       taskID: arguments["taskID"],
      )));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
