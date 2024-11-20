import 'package:flutter/material.dart';
import 'screens/apple.dart';
import 'screens/android.dart';
import 'screens/linux.dart';
import 'screens/windows.dart';

void main() {
  runApp(RoadEyeApp());
}

class RoadEyeApp extends StatefulWidget {
  @override
  _RoadEyeAppState createState() => _RoadEyeAppState();
}

class _RoadEyeAppState extends State<RoadEyeApp> {
  final TextEditingController _nameController = TextEditingController();
  bool _isNameEntered = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RoadEye',
      home: Scaffold(
        appBar: AppBar(
          title: Text('RoadEye'),
        ),
        body: Builder(
          builder: (context) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Gebe deinen vollen Namen ein und wähle ein Betriebssystem!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    labelText: 'Bitte deinen Namen eingeben',
                    labelStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Icon(Icons.person, color: Colors.grey[600]),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      _isNameEntered = text.isNotEmpty;
                    });
                  },
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    _buildSystemButton(
                      context: context,
                      label: 'iOS',
                      icon: Icons.apple,
                      onPressed: _isNameEntered
                          ? () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppleScreen(name: _nameController.text),
                                ),
                              )
                          : null,
                    ),
                    _buildSystemButton(
                      context: context,
                      label: 'Android',
                      icon: Icons.android,
                      onPressed: _isNameEntered
                          ? () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AndroidScreen(name: _nameController.text),
                                ),
                              )
                          : null,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    _buildSystemButton(
                      context: context,
                      label: 'Windows',
                      icon: Icons.window,
                      onPressed: _isNameEntered
                          ? () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WindowsScreen(name: _nameController.text),
                                ),
                              )
                          : null,
                    ),
                    _buildSystemButton(
                      context: context,
                      label: 'Linux',
                      icon: Icons.laptop,
                      onPressed: _isNameEntered
                          ? () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LinuxScreen(name: _nameController.text),
                                ),
                              )
                          : null,
                    ),
                  ],
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSystemButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size(double.infinity, double.infinity),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 100),
              Text(label, style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
