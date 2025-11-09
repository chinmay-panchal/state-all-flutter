import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_fav/view/dashboard_screen.dart';
import 'package:provider_fav/view/home_screen.dart';
import 'package:provider_fav/view_models/dashboard_viewmodel.dart';
import 'package:provider_fav/view_models/todo_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoViewmodel()),
        ChangeNotifierProvider(create: (_) => DashboardViewmodel()),
      ],
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}
