import 'package:flutter/material.dart';
import '../models/Job.dart';

class JobCard extends StatelessWidget {
  final Job job;
  final VoidCallback onSwipeLeft;
  final VoidCallback onSwipeRight;

  JobCard({required this.job, required this.onSwipeLeft, required this.onSwipeRight});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(job.company, style: TextStyle(fontSize: 18, color: Colors.grey[600])),
            SizedBox(height: 16),
            Text('Beschreibung:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(job.description, style: TextStyle(fontSize: 14)),
            SizedBox(height: 16),
            Text('Erforderliche Fähigkeiten:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(job.requiredSkills, style: TextStyle(fontSize: 14)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onSwipeLeft,
                  child: Text('Nächster'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: onSwipeRight,
                  child: Text('Bewerben'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}