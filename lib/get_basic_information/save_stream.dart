import 'package:flutter/material.dart';

class SaveStream extends StatefulWidget {
  const SaveStream({super.key});

  @override
  State<SaveStream> createState() => _SaveStreamState();
}

class _SaveStreamState extends State<SaveStream> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
                const Text("What is your stream?", style: TextStyle(fontSize: 45, color: Colors.black),),
                const SizedBox(height: 40,),
                RadioListTile(
                  title: const Text("Maths"),
                  value: "Maths", 
                  groupValue: selectedOption, 
                  onChanged: (value){
                    setState(() {
                      selectedOption = value!;
                    });
                  }
                ),
                RadioListTile(
                  title: const Text("Bio"),
                  value: "Bio", 
                  groupValue: selectedOption, 
                  onChanged: (value){
                    setState(() {
                      selectedOption = value!;
                    });
                  }
                ),
                RadioListTile(
                  title: const Text("Technology"),
                  value: "Technology", 
                  groupValue: selectedOption, 
                  onChanged: (value){
                    setState(() {
                      selectedOption = value!;
                    });
                  }
                ),
                RadioListTile(
                  title: const Text("Arts"),
                  value: "Arts", 
                  groupValue: selectedOption, 
                  onChanged: (value){
                    setState(() {
                      selectedOption = value!;
                    });
                  }
                ),
                RadioListTile(
                  title: const Text("Commerce"),
                  value: "Commerce", 
                  groupValue: selectedOption, 
                  onChanged: (value){
                    setState(() {
                      selectedOption = value!;
                    });
                  }
                ),
                const SizedBox(height: 40,),
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
      ),
    );
  }
}