import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  File? _profileImage; // Variable für das ausgewählte Bild

  // Funktion zum Auswählen eines Bildes aus der Galerie
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path); // Das Bild wird als File gespeichert
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persönliche Informationen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profilbild
            Center(
              child: GestureDetector(
                onTap: _pickImage, // Funktion aufrufen, um Bild auszuwählen
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!) // Wenn ein Bild ausgewählt wurde, anzeigen
                      : AssetImage('assets/profile_picture.png') as ImageProvider, // Platzhalterbild
                ),
              ),
            ),
            SizedBox(height: 20),

            // Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Vorname',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nachname',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Alter
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Alter',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // E-Mail
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-Mail-Adresse',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Telefonnummer
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Telefonnummer',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Lebenslauf hochladen
            TextButton(
              onPressed: () {
                // Hier könntest du eine Funktion implementieren, um den Lebenslauf hochzuladen
              },
              child: Text('Lebenslauf hochladen'),
            ),
            SizedBox(height: 10),

            // Weitere Informationen (optional)
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Zusätzliche Informationen',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
            // Speichern-Button
            ElevatedButton(
              onPressed: () {
                // Speichern-Funktion für die persönlichen Daten
              },
              child: Text('Speichern'),
            ),
          ],
        ),
      ),
    );
  }
}
