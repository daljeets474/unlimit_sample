import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unlimit_sample/provider/joke_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 60000),
        () => {
              Provider.of<JokeProvider>(context, listen: false).getJoke(context)
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Joke List',
                style: TextStyle(fontSize: 28.0, color: Colors.black),
                textAlign: TextAlign.center),
            Flexible(
              child: ListView.builder(
                  itemCount: Provider.of<JokeProvider>(context, listen: true)
                      .jokeList
                      .length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${Provider.of<JokeProvider>(context, listen: true).jokeList[index].jokeResponseModel!.joke}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
