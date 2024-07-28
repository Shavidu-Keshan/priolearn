import 'package:flutter/material.dart';

class SurveySummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You answered to our questions as following',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              QuestionAnswerWidget(
                question: 'Which hobby do you enjoy the most?',
              ),
              QuestionAnswerWidget(
                question: 'Do you have a favorite sport?\nIf so, what is it?',
              ),
              QuestionAnswerWidget(
                question: 'Do you have a favorite singer?\nIf so, who?',
              ),
              QuestionAnswerWidget(
                question: 'What is your dream travel destination?',
              ),
              QuestionAnswerWidget(
                question: 'Which movie or TV show do you enjoy the most?',
              ),
              QuestionAnswerWidget(
                question: 'Do you have a favorite sport?\nIf so, what is it?',
              ),
              QuestionAnswerWidget(
                question:
                    'Do you have a favorite dish or type of cuisine you love?',
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Confirm'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionAnswerWidget extends StatelessWidget {
  final String question;

  const QuestionAnswerWidget({Key? key, required this.question})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        Text(
          'Answer',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        TextField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
