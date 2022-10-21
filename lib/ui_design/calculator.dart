import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  static const routeName = '/ui_design/calculator';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '0',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: <Widget>[
              CalculatorButton(
                backgroundColor: Theme.of(context).focusColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: 'C',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).focusColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '+/-',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).focusColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '%',
              ),
              CalculatorButton.Icon(
                backgroundColor: Theme.of(context).disabledColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: 'Backspace',
                icon: Icons.backspace,
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).bottomAppBarColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '7',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).bottomAppBarColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '8',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).bottomAppBarColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '9',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).disabledColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '/',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).bottomAppBarColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '4',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).bottomAppBarColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '5',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).bottomAppBarColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '6',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).disabledColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: 'X',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).bottomAppBarColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '1',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).bottomAppBarColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '2',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).bottomAppBarColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '3',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).disabledColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '-',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).bottomAppBarColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '0',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).bottomAppBarColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '.',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).focusColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '=',
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).disabledColor,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '+',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  IconData? icon;

  CalculatorButton({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
  });

  CalculatorButton.Icon({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // CHALLANGE
      },
      child: Container(
        color: backgroundColor,
        child: Center(
          child: icon == null
              ? Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: foregroundColor),
                )
              : Icon(
                  icon,
                  color: foregroundColor,
                ),
        ),
      ),
    );
  }
}
