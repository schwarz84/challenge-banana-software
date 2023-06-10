import 'package:flutter/material.dart';
import 'package:flutter_challenge_2023/screens/screens.dart';
import 'package:flutter_challenge_2023/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp( AppState());

class AppState extends StatelessWidget {
//
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ProductsServices())
      ],
      child: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Challenge 2023',
      initialRoute: 'home',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
        'product': (_) => ProductScreen()
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          color: Color(0xFF9E007E)
        )
    ),
    );
  }
}