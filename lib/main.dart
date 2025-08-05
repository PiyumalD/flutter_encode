import 'package:flutter/material.dart';

void main() => runApp(EncodeDecodeApp());

class EncodeDecodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Encoder/Decoder',
      home: EncodeDecodeScreen(),
    );
  }
}

class EncodeDecodeScreen extends StatefulWidget {
  @override
  _EncodeDecodeScreenState createState() => _EncodeDecodeScreenState();
}

class _EncodeDecodeScreenState extends State<EncodeDecodeScreen> {
  final TextEditingController inputController = TextEditingController();
  String result = '';

  final Map<String, String> encodeMap = {
    '1': 'G',
    '2': 'O',
    '3': 'L',
    '4': 'D',
    '5': 'E',
    '6': 'N',
    '7': 'F',
    '8': 'I',
    '9': 'S',
    '0': 'H',
  };

  Map<String, String> get decodeMap =>
      encodeMap.map((key, value) => MapEntry(value, key));

  void encode() {
    final input = inputController.text;
    final encoded = input.split('').map((char) => encodeMap[char] ?? '?').join();
    setState(() => result = encoded);
  }

  void decode() {
    final input = inputController.text.toUpperCase();
    final decoded = input.split('').map((char) => decodeMap[char] ?? '?').join();
    setState(() => result = decoded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Encoder/Decoder')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: inputController,
              decoration: InputDecoration(labelText: 'Enter input'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: encode, child: Text('Encode')),
                ElevatedButton(onPressed: decode, child: Text('Decode')),
              ],
            ),
            SizedBox(height: 20),
            Text('Result: \$result', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}