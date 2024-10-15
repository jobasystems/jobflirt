import 'package:flutter/material.dart';
import '..lib/models/Job.dart';

class JobCard extends StatelessWidget {
  final Job job;

  JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(job.title),
        subtitle: Text(job.description),
        trailing: Text("Skills: ${job.requiredSkills}"),
      ),
    );
  }
}
