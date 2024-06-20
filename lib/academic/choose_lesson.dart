import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_13_priolearn/academic/content.dart';
import 'package:group_13_priolearn/academic/learning_outcome.dart';

class ChooseLesson extends StatefulWidget {
  const ChooseLesson({super.key});

  @override
  State<ChooseLesson> createState() => _ChooseLessonState();
}

class _ChooseLessonState extends State<ChooseLesson> {
  String? selectedLesson;
  String? selectedCompetency;

  List<String> lessons = [];
  List<String> competencies = [];

  void _navigateToContent() {
    if (selectedLesson!=null && selectedCompetency!=null) {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context)=>Content(
          lessonId:selectedLesson!,
          competencyIndex: competencies.indexOf(selectedCompetency!)
        )
        ));
    }
  }

  void _navigateToLOs() {
    if (selectedLesson!=null && selectedCompetency!=null) {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context)=>LOs(
          lessonId:selectedLesson!,
          competencyIndex: competencies.indexOf(selectedCompetency!)
        )
        ));
    }
  }
  @override
  void initState() {
    super.initState();
    fetchLessons();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subject Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: "Lesson",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              value: selectedLesson,
              items: lessons.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLesson = newValue;
                  competencies = [];
                  selectedCompetency = null;
                });
                fetchCompetencies(selectedLesson!);
              },
            ),
            const SizedBox(height: 30),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: "Competencies",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              value: selectedCompetency,
              items: competencies.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCompetency = newValue;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _navigateToContent,
              child: const Text("Content"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _navigateToLOs,
              child: const Text("Learning Outcomes"),
            ),
          ],
        ),
      ),
    );
  }
  
  Future<void> fetchLessons() async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('physics').get();
    setState(() {
      lessons = querySnapshot.docs.map((doc)=>doc.id).toList();
    });
  }
  Future<void> fetchCompetencies(String lessonId) async{
    final lessonDoc = await FirebaseFirestore.instance.collection('physics').doc(lessonId).get();
    List competenciesList = lessonDoc['competencies'];
    setState(() {
      competencies = List<String>.generate(competenciesList.length,(index){
        return "Competency - ${index+1}";
      });
    });
  }

}
