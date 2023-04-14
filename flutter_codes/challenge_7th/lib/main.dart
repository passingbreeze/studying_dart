import 'dart:async';
import 'package:flutter/material.dart';

const bgColor = Color(0xFFE7626C);
const txtColor = Color(0xFF232B55);
const cardColor = Color(0xFFF4EDDB);
const minutes = [15, 20, 25, 30, 35];
const restLimit = 300;
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: txtColor,
          ),
        ),
        cardColor: cardColor,
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
  static var initSeconds = [for (var n in minutes) n * 60];
  static int initSecond = initSeconds[initSeconds.length >> 1];
  int totalSeconds = initSecond;
  int restSeconds = 0;
  bool isRunning = false;
  bool isOver = false;
  int totalRounds = 0;
  int totalCycles = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        if (totalCycles > 1 && totalCycles % 4 == 0) {
          totalRounds++;
          totalCycles = 0;
          isOver = true;
        } else {
          totalCycles++;
        }
        totalSeconds = initSecond;
      });
    } else {
      setState(() {
        if (isOver) {
          if (restSeconds == restLimit) {
            isOver = false;
            restSeconds = 0;
          } else {
            restSeconds++;
          }
        } else {
          totalSeconds--;
        }
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

  void clickFifteen() {
    setState(() {
      initSecond = initSeconds.first;
      totalSeconds = initSecond;
    });
  }

  void clickTwenty() {
    setState(() {
      initSecond = initSeconds[1];
      totalSeconds = initSecond;
    });
  }

  void clickCenter() {
    setState(() {
      initSecond = initSeconds[initSeconds.length >> 1];
      totalSeconds = initSecond;
    });
  }

  void clickThirty() {
    setState(() {
      initSecond = initSeconds[3];
      totalSeconds = initSecond;
    });
  }

  void clickThirtyFive() {
    setState(() {
      initSecond = initSeconds.last;
      totalSeconds = initSecond;
    });
  }

  void clickStop() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = initSecond;
      totalRounds = 0;
      totalCycles = 0;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            'PoMoTIMER',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).cardColor,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    format(totalSeconds),
                    style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 89,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: clickFifteen,
                      child: Text(
                        '${minutes[0]}',
                        style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: clickTwenty,
                      child: Text(
                        '${minutes[1]}',
                        style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: clickCenter,
                      child: Text(
                        '${minutes[2]}',
                        style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: clickThirty,
                      child: Text(
                        '${minutes[3]}',
                        style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: clickThirtyFive,
                      child: Text(
                        '${minutes[4]}',
                        style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: clickStop,
                  icon: const Icon(Icons.restore_outlined),
                ),
                IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                  icon: Icon(isRunning
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rounds',
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              ),
                            ),
                            Text(
                              '$totalRounds',
                              style: TextStyle(
                                fontSize: 58,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Cycles',
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              ),
                            ),
                            Text(
                              '$totalCycles',
                              style: TextStyle(
                                fontSize: 58,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              ),
                            ),
                          ],
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
    );
  }
}
