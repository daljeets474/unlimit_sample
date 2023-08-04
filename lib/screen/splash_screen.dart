import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unlimit_sample/provider/joke_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 1000),
        () => {
              Provider.of<JokeProvider>(context, listen: false).getJokeFromSp(),
              Navigator.pushNamedAndRemoveUntil(
                  context, 'home', (route) => false)
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Text(
              'Unlimit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
