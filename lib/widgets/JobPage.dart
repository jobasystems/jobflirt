import 'package:flutter/material.dart';
import 'package:jobflirt/models/Job.dart';
import 'package:jobflirt/widgets/JobCard.dart';

class JobSwipePage extends StatefulWidget {
  @override
  _JobSwipePageState createState() => _JobSwipePageState();
}

class _JobSwipePageState extends State<JobSwipePage> {
  List<Job> jobs = [
    Job(
      id: '1',
      title: 'Software Entwickler',
      company: 'Tech Co.',
      description: 'Entwicklung innovativer Softwarelösungen für unsere Kunden.',
      requiredSkills: 'Java, Python, Flutter, Agile Methodiken',
    ),
    Job(
      id: '2',
      title: 'UX Designer',
      company: 'Design Inc.',
      description: 'Gestaltung benutzerfreundlicher Interfaces für mobile und Web-Anwendungen.',
      requiredSkills: 'Figma, Adobe XD, User Research, Prototyping',
    ),
    Job(
      id: '3',
      title: 'Projektmanager',
      company: 'Project Solutions',
      description: 'Leitung komplexer IT-Projekte von der Planung bis zur Umsetzung.',
      requiredSkills: 'PRINCE2, Scrum, MS Project, Kommunikationsfähigkeiten',
    ),
  ];

  int currentJobIndex = 0;

  void skipJob() {
    final skippedJob = jobs[currentJobIndex].title; // Job merken, bevor der Zustand geändert wird
    setState(() {
      if (currentJobIndex < jobs.length - 1) {
        currentJobIndex++;
      } else {
        currentJobIndex = 0;
      }
    });
    print('Job übersprungen: $skippedJob');
  }

  void applyForJob() {
    final appliedJob = jobs[currentJobIndex].title; // Job merken, bevor der Zustand geändert wird
    final appliedCompany = jobs[currentJobIndex].company;
    setState(() {
      if (currentJobIndex < jobs.length - 1) {
        currentJobIndex++;
      } else {
        currentJobIndex = 0;
      }
    });
    print('Beworben für $appliedJob bei $appliedCompany');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Swipe'),
        centerTitle: true,
      ),
      body: jobs.isEmpty
          ? Center(child: Text('Keine Jobs verfügbar'))
          : SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! > 0) {
                    // Swipe nach rechts
                    applyForJob();
                  } else if (details.primaryVelocity! < 0) {
                    // Swipe nach links
                    skipJob();
                  }
                },
                child: JobCard(
                  job: jobs[currentJobIndex],
                  onSwipeLeft: skipJob,
                  onSwipeRight: applyForJob,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}