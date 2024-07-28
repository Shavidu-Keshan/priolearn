import 'package:flutter/material.dart';

class MathsSubjectsSelection extends StatefulWidget {
  const MathsSubjectsSelection({super.key});

  @override
  State<MathsSubjectsSelection> createState() => _MathsSubjectsSelectionState();
}

class _MathsSubjectsSelectionState extends State<MathsSubjectsSelection> {
  List<String> selectedOptions =["Combinded Maths", "Physics"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const Text("What are the subjects you are following?", style: TextStyle(fontSize: 45),),
            const SizedBox(height: 40,),
            Expanded(
              child: ListView(
                children: [
                  CheckboxListTile(
                    title: const Text("Combinded Maths"),
                    value: selectedOptions.contains("Combinded Maths"), 
                    onChanged: (value){
                      setState(() {
                        if(value != null && value==false){
                          _showCombindedMathsAlertDialog();
                        }
                      });
                    }
                  ),
                  CheckboxListTile(
                    title: const Text("Chemistry"),
                    value: selectedOptions.contains("Chemistry"), 
                    onChanged: (value){
                      setState(() {
                        if(value != null && value){
                          selectedOptions.add("Chemistry");
                          selectedOptions.remove("ICT");
                        }
                        else{
                          selectedOptions.remove("Chemistry");
                        }
                      });
                    }
                  ),
                  CheckboxListTile(
                    title: const Text("Physics"),
                    value: selectedOptions.contains("Physics"), 
                    onChanged: (value){
                      setState(() {
                        if(value != null && value==false){
                          _showPhysicsAlertDialog();
                        }
                      });
                    }
                  ),
                  CheckboxListTile(
                    title: const Text("ICT"),
                    value: selectedOptions.contains("ICT"), 
                    onChanged: (value){
                      setState(() {
                        if(value != null && value){
                          selectedOptions.add("ICT");
                          selectedOptions.remove("Chemistry");
                        }
                        else{
                          selectedOptions.remove("ICT");
                        }
                      });
                    }
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
              onPressed: (){}, 
              child: Text("Next", style: TextStyle(fontSize: 30, color: Colors.white),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, minimumSize:Size(double.infinity, 55)),
              ),
            )
          ],
        ),
      ),
    );
  }
  
  void _showCombindedMathsAlertDialog() {
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Combinded Maths can't be unchecked!"),
          content: const Text("As a Physical Science student, you must follow this subject."),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: const Text("OK"))
          ],
        );
      }
      );
  }
  void _showPhysicsAlertDialog() {
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Physics can't be unchecked!"),
          content: const Text("As a Physical Science student, you must follow this subject."),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: const Text("OK"))
          ],
        );
      }
      );
  }
}