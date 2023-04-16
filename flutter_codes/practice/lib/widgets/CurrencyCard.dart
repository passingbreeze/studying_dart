import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String currencyText;
  final String budgetText;
  final String currencyUnit;
  final IconData currencyIcon;
  final bool isInverted;

  final _blackColor = const Color(0xff1f2123);

  const CurrencyCard({
    super.key,
    required this.currencyText,
    required this.budgetText,
    required this.currencyUnit,
    required this.currencyIcon,
    required this.isInverted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isInverted ? Colors.white : _blackColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currencyText,
                  style: TextStyle(
                    color: isInverted ? _blackColor : Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      budgetText,
                      style: TextStyle(
                        color: isInverted ? _blackColor : Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      currencyUnit,
                      style: TextStyle(
                        color: isInverted ? _blackColor : Colors.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Transform.scale(
              scale: 1.7,
              child: Transform.translate(
                offset: const Offset(5, 13),
                child: Icon(
                  currencyIcon,
                  color: isInverted ? _blackColor : Colors.white,
                  size: 98,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
