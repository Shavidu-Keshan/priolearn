import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_13_priolearn/academic/choose_lesson.dart';
import 'package:group_13_priolearn/academic/select_subject.dart';
import 'package:group_13_priolearn/activities/activities.dart';
import 'package:group_13_priolearn/mindfulness/mood_check.dart';
import 'package:group_13_priolearn/progress/main_bar_graph.dart';
import 'package:group_13_priolearn/progress/show_progress.dart';
import 'package:group_13_priolearn/settings/about.dart';
import 'package:group_13_priolearn/pages/contact.dart';
import 'package:group_13_priolearn/settings/account.dart';
import 'package:group_13_priolearn/to_do/to_do_home.dart';
import 'package:group_13_priolearn/utils/colors.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

// create valribles for save up to now days and achievements
double myProgress = 0.3;
List<String> achievements = [
  "I've completed Physics 2013 3rd",
  "I've completed Physics 2013 3rd essay question",
  "I've completed Physics 2013 3rd essay question",
  "I've completed Physics 2013 3rd essay question"
]; // in here I've assigned some dummy data

class _NewHomeState extends State<NewHome> {
  // declare a variable for bottom app bar selected item
  int _selectedItem = 0;
  // declare a function for bottom app bar item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewHome()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StressQuestionsPage()));
        break;
      default:
        index = 0;
    }
  }

  // get the start of the week
  DateTime get _startOfWeek {
    final DateTime now = DateTime.now();
    return now.subtract(Duration(days: now.weekday - 1));
  }

  //get the end of the week
  DateTime get _endOfWeek {
    final DateTime now = DateTime.now();
    return now.add(Duration(days: DateTime.daysPerWeek - now.weekday));
  }

  @override
  Widget build(BuildContext context) {
    int _totalMinutes;
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text(
              "PrioLearn",
              style: TextStyle(
                color: Colors.blue,
              ),
            )),
          ),
          endDrawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  _drawyerItem("To Do List", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ToDoHome(),
                        ));
                  }),
                  _drawyerItem("Reduce Stress", () {}),
                  _drawyerItem("Make a Plan", () {}),
                  _drawyerItem("Invite Friends", () {}),
                  _drawyerItem("About App", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const About(),
                        ));
                  }),
                  _drawyerItem("Contact Us", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Contact(),
                        ));
                  }),
                  _drawyerItem("Terms and Conditions", () {}),
                  _drawyerItem("App Settings", () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Account(),
                        ));
                  }),
                ],
              ),
            ),
          ),
          bottomNavigationBar: MoltenBottomNavigationBar(
            selectedIndex: _selectedItem,
            onTabChange: (clickedIndex) {
              setState(() {
                _selectedItem = clickedIndex;
              });
            },
            tabs: [
              MoltenTab(
                icon: Icon(Icons.home),
              ),
              MoltenTab(
                icon: Icon(Icons.menu_book_sharp),
              ),
              MoltenTab(
                icon: Icon(Icons.self_improvement),
              ),
            ],
          ),
          // Adding 2 images into the screen
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // ------ display total learning time -------
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('tasks')
                          .where('type', isEqualTo: 'Academic')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        } else {
                          var items = snapshot.data!.docs;
                          _totalMinutes = 0;
                          for (var item in items) {
                            dynamic dateData = item['date'];
                            DateTime date = DateTime.now();

                            if (dateData is Timestamp) {
                              date = dateData.toDate();
                            } else if (dateData is String) {
                              date = DateTime.parse(dateData);
                            }

                            if (date.isAfter(_startOfWeek) &&
                                date.isBefore(_endOfWeek)) {
                              _totalMinutes += item['duration'] as int;
                            }
                          }
                          return Container(
                            width: size.width,
                            child: Card(
                              margin: EdgeInsets.all(10),
                              color: Colors.blue.shade100,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "In past 7 days, you have spent\n${_totalMinutes} mins\non your academics",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      }),

                  // ------------------------------------------,
                  SizedBox(height: 20),

                  // great works card list
                  SizedBox(
                    height: 35,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("My Great Works",
                              style: TextStyle(fontSize: 20)),
                          TextButton(
                            onPressed: () {},
                            child: Text("See All"),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            achievements.length > 3 ? 3 : achievements.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: _greatWorkCard(achievements[index]),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Quick Actions",
                    style: TextStyle(fontSize: 20),
                  ),
                  Wrap(
                    children: [
                      _quickActionButtonCard("To-Do", "assets/image-11.jpeg",
                          () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ToDoHome(),
                            ));
                      }),
                      _quickActionButtonCard("Academic", "assets/image-6.jpg",
                          () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectSubject(),
                            ));
                      }),
                      _quickActionButtonCard(
                          "Mindfulness", "assets/image-5.jpg", () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StressQuestionsPage(),
                            ));
                      }),
                      _quickActionButtonCard("Progress", "assets/image-8.jpg",
                          () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowProgress()));
                      }),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

// create a common widget for drawyer items
Widget _drawyerItem(String title, Function myFunction) {
  return ListTile(
    title: Text(title),
    onTap: () {
      myFunction();
    },
  );
}

// create a common widget for quick action menu button

Widget _quickActionButtonCard(
    String menuName, String imagePath, Function myFuction) {
  return Card(
    child: InkWell(
      onTap: () {
        myFuction();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath,
              height: 120,
            ),
          ),
          Text(menuName)
        ],
      ),
    ),
  );
}

// create a common widget for greate works cards

Widget _greatWorkCard(String text) {
  return Card(
    color: Colors.blue.shade200,
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    ),
  );
}
