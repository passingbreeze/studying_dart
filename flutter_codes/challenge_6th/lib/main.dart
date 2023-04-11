import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('images/hjm.png'),
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white.withOpacity(0.8),
                    size: 40,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'MONDAY 16',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    Text(
                      'TODAY',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '·',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      '17',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '18',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '19',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '20',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '21',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '22',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF754),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: const [
                              Text(
                                "11",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text("30", style: TextStyle(fontSize: 10)),
                              Text("|", style: TextStyle(fontSize: 10)),
                              Text("12",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text("20", style: TextStyle(fontSize: 10)),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "DESIGN\nMEETING",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "ALEX",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "HELENA",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "NANA",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF9C6BCE),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: const [
                              Text(
                                "12",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text("35", style: TextStyle(fontSize: 10)),
                              Text("|", style: TextStyle(fontSize: 10)),
                              Text("14",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text("10", style: TextStyle(fontSize: 10)),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "DAILY\nPROJECT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "ME",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "RICHARD",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "CIRY",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "+4",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFBCEE4B),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: const [
                              Text(
                                "15",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text("00", style: TextStyle(fontSize: 10)),
                              Text("|", style: TextStyle(fontSize: 10)),
                              Text("16",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text("30", style: TextStyle(fontSize: 10)),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "WEEKLY\nPLANNING",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "DEN",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "NANA",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "MARK",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // TodoCard(from, to, TodoText, peoples),
              // TodoCard(),
              // TodoCard()
            ],
          ),
        ),
      ),
    );
  }
}
