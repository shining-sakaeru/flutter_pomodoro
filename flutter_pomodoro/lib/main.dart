import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POMOTIMER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const basicTime = 5;
  // static const restTime = 5 * 60;
  int totalSeconds = basicTime;
  bool isRunning = false;
  bool isSelected = false;
  int roundPomodoros = 0;
  int goalPomodoro = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('TIME TO REST!'),
            content: const Text('PLEASE REST 5 MINUTES TO GO'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'),
              ),
            ],
          );
        },
      );
      setState(() {
        if (roundPomodoros == 4) {
          roundPomodoros = 0;
          goalPomodoro = goalPomodoro + 1;
        } else {
          roundPomodoros = roundPomodoros + 1;
          isRunning = false;
          totalSeconds = basicTime;
        }
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onTimePressed() {
    setState(() {
      Text(format(totalSeconds));
      isSelected = true;
    });
  }

  void onResetPressed() {
    roundPomodoros = 0;
    goalPomodoro = 0;
    setState(() {});
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'POMOTIMER',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  format(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 100,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  tileMode: TileMode.mirror,
                  colors: [Colors.white, Colors.white.withOpacity(0.05)],
                  stops: const [0.6, 1],
                ).createShader(bounds);
              },
              child: SizedBox(
                height: 50,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    OutlinedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red,
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          width: 60,
                          child: const Text(
                            '15',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        totalSeconds = 15 * 60;
                        onTimePressed();
                      },
                    ),
                    OutlinedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.red,
                            ),
                          ]),
                          alignment: Alignment.center,
                          width: 60,
                          child: const Text(
                            '20',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        totalSeconds = 20 * 60;
                        onTimePressed();
                      },
                    ),
                    OutlinedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.red,
                            ),
                          ]),
                          alignment: Alignment.center,
                          width: 60,
                          child: const Text(
                            '25',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        totalSeconds = 25 * 60;
                        onTimePressed();
                      },
                    ),
                    OutlinedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.red,
                            ),
                          ]),
                          alignment: Alignment.center,
                          width: 60,
                          child: const Text(
                            '30',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        totalSeconds = 30 * 60;
                        onTimePressed();
                      },
                    ),
                    OutlinedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.red,
                            ),
                          ]),
                          alignment: Alignment.center,
                          width: 60,
                          child: const Text(
                            '35',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        totalSeconds = 35 * 60;
                        onTimePressed();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Center(
                child: IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                  icon: Icon(isRunning
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$roundPomodoros/4',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                  ),
                                ),
                                Text(
                                  'ROUND',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$goalPomodoro/12',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                  ),
                                ),
                                Text(
                                  'GOAL',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 0,
              child: IconButton(
                onPressed: () {
                  onResetPressed();
                },
                icon: const Icon(Icons.restore),
                iconSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
