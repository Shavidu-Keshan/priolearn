import 'package:flutter/material.dart';

class ComMathsContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 7, 4, 227)),
          onPressed: () {
            // handle back button press
          },
        ),
        title: Text(
          'Combined Maths',
          style: TextStyle(
              color: Color.fromARGB(255, 7, 4, 227),
              fontWeight: FontWeight.bold,
              fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Content',
              style: TextStyle(
                color: Color.fromARGB(255, 7, 4, 227),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'You will learn in this chapter...',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      'Historical evolution of the number system',
                      style: TextStyle(
                          color: Color.fromARGB(255, 7, 4, 227), fontSize: 20),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Geometrical representation of real number',
                      style: TextStyle(
                          color: Color.fromARGB(255, 7, 4, 227), fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 7, 4, 227),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              onPressed: () {
                // handle button press
              },
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 7, 4, 227),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book, color: Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: '',
          ),
        ],
        currentIndex: 1, // set the initial selected index
        onTap: (int index) {
          // handle navigation logic here
        },
      ),
    );
  }
}
