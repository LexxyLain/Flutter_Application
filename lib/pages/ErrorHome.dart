import 'monthlyincome.dart';
import 'bonusincome.dart';
import 'settings.dart';
import 'package:flutter/material.dart'; // Keep this import for Flutter widgets
import 'package:table_calendar/table_calendar.dart'; // Import TableCalendar from the table_calendar package

// Define a global variable to hold the budget value
double globalBudget = 200.0;

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Home Page'),
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            TableCalendar(
              // Update properties as needed
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                todayColor: Colors.blue,
                selectedColor: Theme.of(context).primaryColor,
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
              ),
              calendarBuilders: CalendarBuilders(
                // Update cell styles as needed
                selectedDayBuilder: (context, date, _) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft, // Align the button to the bottom left
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 20.0), // Adjust padding
                  child: ElevatedButton(
                    onPressed: () {
                      // Add functionality for the weekly stat button here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 255, 255, 255),
                      shadowColor: Colors.grey.withOpacity(0.5),
                      elevation: 5,
                    ),
                    child: Text(
                      'View Weekly Stat',
                      style: TextStyle(
                        color: Color.fromARGB(255, 194, 175, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
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
              child: Padding(
                padding: EdgeInsets.all(10.0), // Add padding here
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/cent.png',
                      width: 80.0,
                      height: 80.0,
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      children: [
                        Text(
                          '\₱${globalBudget.toStringAsFixed(2)}', // Access the global budget variable here
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Balance | Estimated',
                          style: TextStyle(fontSize: 20.0),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 214, 194, 12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    radius: 40,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color.fromARGB(255, 255, 230, 0),
                    ),
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Set Monthly Income'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonthlyIncome()),
                );
              },
            ),
            ListTile(
              title: Text('Add Bonus Income'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BonusIncome()),
                );
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
            // Add more items as needed
          ],
        ),
      ),
    );
  }
}
