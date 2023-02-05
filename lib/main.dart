import 'package:flutter/material.dart';
import 'package:mvvvm_architecture/Utls/routes/route_name.dart';
import 'package:mvvvm_architecture/Utls/routes/routes.dart';
import 'package:mvvvm_architecture/View_Model/auth_view_model.dart';
import 'package:mvvvm_architecture/View_Model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
        ],
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesName.Splash,
      onGenerateRoute: Routes.generateRoute,
    ),
    );
  }
}

