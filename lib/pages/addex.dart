import 'package:flutter/material.dart';

class Addex extends StatefulWidget {
  @override
  _AddexState createState() => _AddexState();
}

class _AddexState extends State<Addex> {
  double budget = 200.0; // Set your initial budget value
  double expenses = 0.0;
  TextEditingController expenseController = TextEditingController(); // Controller for the text input

  void _addExpense() {
    // Convert the user input to a double, assuming it's a valid number
    double amount = double.tryParse(expenseController.text) ?? 0.0;

    setState(() {
      expenses += amount;
      budget -= amount; // Deduct the expense from the budget
    });

    // Clear the text input after adding expense
    expenseController.clear();
  }

  void _addBudget() {
    // Convert the user input to a double, assuming it's a valid number
    double amount = double.tryParse(expenseController.text) ?? 0.0;

    setState(() {
      budget += amount; // Add the budget
    });

    // Clear the text input after adding budget
    expenseController.clear();
  }

  void _reset() {
    setState(() {
      expenses = 0.0;
      budget = 0.0; // Reset both expenses and budget to zero
    });
  }

  @override
  Widget build(BuildContext context) {
    Color budgetColor = budget >= 0 ? Colors.green : Colors.red; // Determine the color based on budget value

    return Scaffold(
      appBar: AppBar(
        title: Text('Addex Page'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/back.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 70.0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Budget:',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Golos UI'),
                    ),
                    Text(
                      '₱${budget.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 38, color: budgetColor, fontFamily: 'Golos UI'),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Expenses:',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Golos UI'),
                    ),
                    Text(
                      '₱${expenses.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 38, color: Colors.black, fontFamily: 'Golos UI'),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 50.0,
                      width: 250, // Adjust the height as needed
                      child: TextField(
                        controller: expenseController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Enter amount',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: _addExpense,
                          child: Text(
                            'Add Expense',
                            style: TextStyle(color: Colors.black, fontFamily: 'Golos UI'),
                          ),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.black,
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                        SizedBox(width: 20.0),
                        OutlinedButton(
                          onPressed: _addBudget,
                          child: Text(
                            'Add Budget',
                            style: TextStyle(color: Colors.black, fontFamily: 'Golos UI'),
                          ),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.black,
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    OutlinedButton(
                      onPressed: _reset,
                      child: Text(
                        'Reset',
                        style: TextStyle(color: Colors.black, fontFamily: 'Golos UI'),
                      ),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
