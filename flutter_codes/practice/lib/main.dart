import 'package:flutter/material.dart';
import 'package:manhwaflix/widgets/Button.dart';
import 'package:manhwaflix/widgets/CurrencyCard.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key}); // widget's identifier

  // flutter codes are composition of Widgets
  // start point of entire app
  @override
  Widget build(BuildContext context) {
    // build UI method : build
    return MaterialApp(
      home: Scaffold(
        // Widget들을 조립하는데 중요한 Widget
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Column(
              // 세로가 MainAxis
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  // 가로가 MainAxis
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Hey, Selena",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "\$5_194_482",
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Button(
                      buttonText: 'Transfer',
                      bgColor: Colors.amber,
                      textColor: Colors.black,
                    ),
                    Button(
                      buttonText: 'Request',
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Transform.translate(
                  offset: const Offset(0, -10),
                  child: const CurrencyCard(
                    currencyText: 'Euro',
                    budgetText: '6_428',
                    currencyUnit: 'EUR',
                    currencyIcon: Icons.euro_rounded,
                    isInverted: false,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -70),
                  child: const CurrencyCard(
                    currencyText: 'Bitcoin',
                    budgetText: '9_328',
                    currencyUnit: 'BTC',
                    currencyIcon: Icons.currency_bitcoin,
                    isInverted: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
