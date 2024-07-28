import 'package:flutter/material.dart';

class BioSubjectsSelection extends StatefulWidget {
  const BioSubjectsSelection({super.key});

  @override
  State<BioSubjectsSelection> createState() => _BioSubjectsSelectionState();
}

class _BioSubjectsSelectionState extends State<BioSubjectsSelection> {
  List<String> selectedOptions =["Biology", "Chemistry"];
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
                    title: const Text("Biology"),
                    value: selectedOptions.contains("Biology"), 
                    onChanged: (value){
                      setState(() {
                        if(value != null && value==false){
                          _showBiologyAlertDialog();
                        }
                      });
                    }
                  ),
                  CheckboxListTile(
                    title: const Text("Physics"),
                    value: selectedOptions.contains("Physics"), 
                    onChanged: (value){
                      setState(() {
                        if(value != null && value){
                          selectedOptions.add("Physics");
                          selectedOptions.remove("Agriculture");
                        }
                        else{
                          selectedOptions.remove("Physics");
                        }
                      });
                    }
                  ),
                  CheckboxListTile(
                    title: const Text("Chemistry"),
                    value: selectedOptions.contains("Chemistry"), 
                    onChanged: (value){
                      setState(() {
                        if(value != null && value==false){
                          _showChemistryAlertDialog();
                        }
                      });
                    }
                  ),
                  CheckboxListTile(
                    title: const Text("Agriculture"),
                    value: selectedOptions.contains("Agriculture"), 
                    onChanged: (value){
                      setState(() {
                        if(value != null && value){
                          selectedOptions.add("Agriculture");
                          selectedOptions.remove("Physics");
                        }
                        else{
                          selectedOptions.remove("Agriculture");
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
  
  void _showBiologyAlertDialog() {
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Biology can't be unchecked!"),
          content: const Text("As a Biological Science student, you must follow this subject."),
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
  void _showChemistryAlertDialog() {
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Chemistry can't be unchecked!"),
          content: const Text("As a Biological Science student, you must follow this subject."),
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