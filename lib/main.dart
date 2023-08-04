import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unlimit_sample/provider/joke_provider.dart';
import 'package:unlimit_sample/screen/home_screen.dart';
import 'package:unlimit_sample/screen/splash_screen.dart';

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
        ChangeNotifierProvider(create: (_) => JokeProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => const SplashScreen(),
          'home': (context) => const HomeScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
