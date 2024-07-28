import 'package:flutter/material.dart';

class MyAcademicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Academics',
          style: TextStyle(
              color: Color.fromARGB(255, 7, 4, 227),
              fontSize: 33,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'You have completed 38% from whole journey...',
                      style: TextStyle(
                          color: Color.fromARGB(255, 7, 4, 227),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    LinearProgressIndicator(
                      value: 0.38,
                      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 7, 4, 227)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Select a subject for save details...',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            SubjectButton(subjectName: 'Com Maths'),
            SubjectButton(subjectName: 'Physics'),
            SubjectButton(subjectName: 'Chemistry'),
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
        currentIndex: 0, // set the initial selected index
        onTap: (int index) {
          // handle navigation logic here
        },
      ),
    );
  }
}

class SubjectButton extends StatelessWidget {
  final String subjectName;

  const SubjectButton({required this.subjectName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 224, 197, 197),
          side: BorderSide(color: Color.fromARGB(255, 7, 4, 227)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          // handle button press
        },
        child: Text(
          subjectName,
          style: TextStyle(color: Color.fromARGB(255, 7, 4, 227)),
        ),
      ),
    );
  }
}
