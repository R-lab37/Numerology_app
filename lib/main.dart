// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 98, 0, 255))),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';
  String dateOfBirth = '';
  int lifePathNumber = 0;
  int expressionNumber = 0;
  int soulUrgeNumber = 0;
  int personalityNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numerology App'),
        leading: Icon(Icons.numbers_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your name ',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your date of birth ex 12-12-2004',
              ),
              onChanged: (value) {
                setState(() {
                  dateOfBirth = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Calculate'),
              onPressed: () {
                setState(() {
                  lifePathNumber = calculateLifePathNumber(dateOfBirth);
                  expressionNumber = calculateExpressionNumber(name);
                  soulUrgeNumber = calculateSoulUrgeNumber(name);
                  personalityNumber = calculatePersonalityNumber(name);
                });
              },
            ),
            SizedBox(height: 20),
            Text('Life Path Number: $lifePathNumber'),
            Text('Expression Number: $expressionNumber'),
            Text('Soul Urge Number: $soulUrgeNumber'),
            Text('Personality Number: $personalityNumber'),
          ],
        ),
      ),
    );
  }

  // Calculates the Life Path Number
  int calculateLifePathNumber(String dateOfBirth) {
    // Split the date of birth into its individual components
    List<int> dateOfBirthComponents = dateOfBirth
        .split('-')
        .map((component) => int.parse(component))
        .toList();

    // Calculate the Life Path Number by adding up all of the individual components of the date of birth
    int lifePathNumber = 0;
    for (int component in dateOfBirthComponents) {
      lifePathNumber += component;
    }

    // Reduce the Life Path Number to a single digit
    while (lifePathNumber > 9) {
      int sumOfDigits = 0;
      while (lifePathNumber > 0) {
        sumOfDigits += lifePathNumber % 10;
        lifePathNumber = lifePathNumber ~/ 10;
      }
      lifePathNumber = sumOfDigits;
    }

    return lifePathNumber;
  }

  // Calculates the Expression Number
  int calculateExpressionNumber(String name) {
    // Convert the name to uppercase and remove all spaces and special characters
    String nameWithoutSpaces =
        name.toUpperCase().replaceAll(RegExp(r'[^\w\s]'), '');

    // Calculate the Expression Number by adding up the numerical values of the letters in the name
    int expressionNumber = 0;
    for (int i = 0; i < nameWithoutSpaces.length; i++) {
      int letterValue = nameWithoutSpaces[i].codeUnitAt(0) - 64;
      expressionNumber += letterValue;
    }

    // Reduce the Expression Number to a single digit
    while (expressionNumber > 9) {
      int sumOfDigits = 0;
      while (expressionNumber > 0) {
        sumOfDigits += expressionNumber % 10;
        expressionNumber = expressionNumber ~/ 10;
      }
      expressionNumber = sumOfDigits;
    }

    return expressionNumber;
  }

  // Calculates the SoulUrgeNumber Number
  int calculateSoulUrgeNumber(String name) {
    // Get the vowels in the name
    String vowels = name.replaceAll(RegExp(r'[^\aeiou]'), '');

    // Calculate the Soul Urge Number by adding up the numerical values of the vowels in the name
    int soulUrgeNumber = 0;
    for (int i = 0; i < vowels.length; i++) {
      int vowelValue = vowels[i].codeUnitAt(0) - 96;
      soulUrgeNumber += vowelValue;
    }

    // Reduce the Soul Urge Number to a single digit
    while (soulUrgeNumber > 9) {
      int sumOfDigits = 0;
      while (soulUrgeNumber > 0) {
        sumOfDigits += soulUrgeNumber % 10;
        soulUrgeNumber = soulUrgeNumber ~/ 10;
      }
      soulUrgeNumber = sumOfDigits;
    }

    return soulUrgeNumber;
  }

  // Calculates the Personality  Number
  int calculatePersonalityNumber(String name) {
    // Get the consonants in the name
    String consonants = name.replaceAll(RegExp(r'[aeiou]'), '');

    // Calculate the Personality Number by adding up the numerical values of the consonants in the name
    int personalityNumber = 0;
    for (int i = 0; i < consonants.length; i++) {
      int consonantValue = consonants[i].codeUnitAt(0) - 64;
      personalityNumber += consonantValue;
    }

    // Reduce the Personality Number to a single digit
    while (personalityNumber > 9) {
      int sumOfDigits = 0;
      while (personalityNumber > 0) {
        sumOfDigits += personalityNumber % 10;
        personalityNumber = personalityNumber ~/ 10;
      }
      personalityNumber = sumOfDigits;
    }

    return personalityNumber;
  }
}
