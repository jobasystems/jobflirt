import 'package:flutter/material.dart';

void main() => runApp(const app());

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context){
    const String appTitle = "Jobflirt - find a Job";
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const Center(
          child: Text("Test Text"),
        ),
      ),
    );
  }
}

class titleSection extends StatelessWidget {
  const titleSection({
    super.key,
    required this.name,
    required this.location,
  });

}