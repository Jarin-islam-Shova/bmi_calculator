import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/input': (context) => InputPage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network('https://www.shutterstock.com/image-vector/indicator-measuring-body-mass-index-260nw-1898340541.jpg'), // Add your logo image in assets
            SizedBox(height: 20),
            Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/input');
              },
              child: Text('Start'),

            ),
          ],
        ),
      ),
      backgroundColor: Colors.brown,
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Details'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: weightController,
              decoration: InputDecoration(labelText: 'Enter weight (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: heightController,
              decoration: InputDecoration(labelText: 'Enter height (cm)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double weight = double.parse(weightController.text);
                double height = double.parse(heightController.text) / 100;
                double bmi = weight / (height * height);

                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: bmi,
                );
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey
    );
  }
}

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double bmi = ModalRoute.of(context)!.settings.arguments as double;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI Result'),
        backgroundColor: Colors.green
      ),
      body: Center(
        child: Text(
          'Your BMI is ${bmi.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 24),
        ),
      ),
      backgroundColor: Colors.blueGrey
    );
  }
}