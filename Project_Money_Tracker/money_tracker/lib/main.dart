import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constand/screen/page/home.dart';
import './constand/model/balance_Model.dart';
import './constand/login/wellcome.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BalanceModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color.fromARGB(255, 213, 222, 238),
      ),
      // home: const HomePage(),
      home: const WellcomePage(),
    );
  }
}
