import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LOs extends StatefulWidget {
  final String subjectName;
  final String lessonId;
  final int competencyIndex;
  const LOs({super.key, required this.lessonId, required this.competencyIndex, required this.subjectName});

  @override
  State<LOs> createState() => _LOsState();
}

class _LOsState extends State<LOs> {
  List<dynamic>? learningOutcomes;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchLearningOutcomes();
  }

  Future<void> fetchLearningOutcomes() async {
    try {
      final lessonDoc = await FirebaseFirestore.instance
          .collection(widget.subjectName)
          .doc(widget.lessonId)
          .get();
      List learningOutcomesList = lessonDoc['competencies'];
      setState(() {
        learningOutcomes = learningOutcomesList[widget.competencyIndex]['learning-outcomes'];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading learning outcomes: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning Outcomes"),
        backgroundColor: Colors.green,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : learningOutcomes == null
              ? const Center(child: Text("No learning outcomes available"))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: learningOutcomes!.length,
                  itemBuilder: (context, index) {
                    return LearningOutcomeCard(
                      outcome: learningOutcomes![index],
                      index: index,
                    );
                  },
                ),
    );
  }
}

class LearningOutcomeCard extends StatelessWidget {
  final dynamic outcome;
  final int index;

  const LearningOutcomeCard({Key? key, required this.outcome, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${index + 1}",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              outcome.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}