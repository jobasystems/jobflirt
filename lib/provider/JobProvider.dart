import 'package:flutter/material.dart';
import '../models/Job.dart';

class JobProvider with ChangeNotifier {
  List<Job> _jobs = [
    Job(id: '1', title: 'Flutter Entwickler', description: 'Entwicklung mobiler Apps', requiredSkills: 'Flutter, Dart'),
    Job(id: '2', title: 'Backend Entwickler', description: 'Serverseitige Entwicklung', requiredSkills: 'Node.js, Java'),
    // Mehr Jobs
  ];

  List<Job> getMatchingJobs(String userSkills) {
    return _jobs.where((job) => job.requiredSkills.contains(userSkills)).toList();
  }
}
