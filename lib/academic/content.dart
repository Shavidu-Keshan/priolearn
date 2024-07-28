import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Content extends StatefulWidget {
  final String subjectName;
  final String lessonId;
  final int competencyIndex;
  const Content({super.key, required this.lessonId, required this.competencyIndex, required this.subjectName});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  List<dynamic>? content;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchContent();
  }

  Future<void> fetchContent() async {
    try {
      final lessonDoc = await FirebaseFirestore.instance
          .collection(widget.subjectName)
          .doc(widget.lessonId)
          .get();
      List competenciesList = lessonDoc['competencies'];
      setState(() {
        content = competenciesList[widget.competencyIndex]['content'];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading content: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson Content"),
        backgroundColor: Colors.blue,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : content == null
              ? const Center(child: Text("No content available"))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: content!.length,
                  itemBuilder: (context, index) {
                    return ContentCard(item: content![index], index: index);
                  },
                ),
    );
  }
}

class ContentCard extends StatelessWidget {
  final dynamic item;
  final int index;

  const ContentCard({Key? key, required this.item, required this.index}) : super(key: key);

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
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              item.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}