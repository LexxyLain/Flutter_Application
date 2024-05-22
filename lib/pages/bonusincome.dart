import 'package:flutter/material.dart';

class BonusIncome extends StatelessWidget {
  final Color yellowColor = Color.fromARGB(255, 214, 194, 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bonus Income'),
        backgroundColor: yellowColor, // Yellow color palette for the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Amount',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: yellowColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Savings button press
                  },
                  child: Text('Savings'),
                  style: ElevatedButton.styleFrom(
                    primary: yellowColor, // Button background color
                    onPrimary: Colors.black, // Button text color
                  ),
                ),
                SizedBox(width: 20), // Spacing between the buttons
                ElevatedButton(
                  onPressed: () {
                    // Handle Budget button press
                  },
                  child: Text('Budget'),
                  style: ElevatedButton.styleFrom(
                    primary: yellowColor, // Button background color
                    onPrimary: Colors.black, // Button text color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BonusIncome(),
  ));
}
