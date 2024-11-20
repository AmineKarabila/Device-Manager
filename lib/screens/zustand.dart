import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ZustandScreen extends StatefulWidget {
  final String workerName;
  final String deviceName;

  ZustandScreen({required this.workerName, required this.deviceName});

  @override
  _ZustandScreenState createState() => _ZustandScreenState();
}

class _ZustandScreenState extends State<ZustandScreen> {
  final TextEditingController _damageReportController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bestellbestätigung'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bestätigung:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Mitarbeiter: ${widget.workerName}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Gerät: ${widget.deviceName}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            Text(
              'Beschädigungen eintragen:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _damageReportController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Beschädigungen (falls vorhanden) hier eintragen',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _pickImage,
                child: Text('Foto machen'),
              ),
            ),
            if (_image != null) ...[
              SizedBox(height: 16),
              Center(
                child: Image.file(
                  _image!,
                  height: 200,
                ),
              ),
            ],
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String damageReport = _damageReportController.text;
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Bestätigung'),
                      content: Text(
                        'Das Gerät "${widget.deviceName}" wurde von "${widget.workerName}" übernommen.' +
                        (damageReport.isNotEmpty ? '\nGemeldete Beschädigungen: $damageReport' : '\nKeine Beschädigungen gemeldet.')
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Bestätigen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
