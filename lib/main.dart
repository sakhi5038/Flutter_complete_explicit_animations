import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final tween = Tween<double>(begin: 0, end: 2 * pi);
  late Animation _animation;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.fling();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.rotate(
                origin: const Offset(150, 50),
                angle: _animationController.value,
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.amber,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                _animationController.forward();
              },
              tooltip: 'forward',
              child: const Icon(Icons.arrow_forward),
            ),
            FloatingActionButton(
              onPressed: () {
                _animationController.reverse();
              },
              tooltip: 'reverse',
              child: const Icon(Icons.arrow_back),
            ),
            FloatingActionButton(
              onPressed: () {
                _animationController.repeat();
              },
              tooltip: 'repeat',
              child: const Icon(Icons.repeat),
            ),
            FloatingActionButton(
              onPressed: () {
                _animationController.stop();
              },
              tooltip: 'stop',
              child: const Icon(Icons.stop),
            )
          ],
        ));
  }
}
