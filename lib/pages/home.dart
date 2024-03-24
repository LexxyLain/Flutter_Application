import 'package:flutter/material.dart';

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 205.0),
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
              ),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
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
            ],
          ),
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
                // Handle the item click
              },
            ),
            ListTile(
              title: Text('Add Bonus Income'),
              onTap: () {
                // Handle the item click
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Handle the item click
              },
            ),
            // Add more items as needed
          ],
        ),
      ),
    );
  }
}

