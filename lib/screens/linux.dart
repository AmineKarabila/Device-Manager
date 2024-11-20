import 'package:flutter/material.dart';
import 'zustand.dart';

class LinuxScreen extends StatefulWidget {
  final String name;
  LinuxScreen({required this.name});

  @override
  _LinuxScreenState createState() => _LinuxScreenState();
}

class _LinuxScreenState extends State<LinuxScreen> {
  final List<Map<String, String>> linuxDevices = [
    {'name': 'PinePhone', 'year': '2019'},
    {'name': 'Librem 5', 'year': '2019'},
    {'name': 'Fairphone 2 (mit Ubuntu Touch)', 'year': '2015'},
    {'name': 'Nexus 5 (mit Ubuntu Touch)', 'year': '2013'},
    {'name': 'Volla Phone', 'year': '2020'},
    {'name': 'OnePlus One (mit Ubuntu Touch)', 'year': '2014'},
    {'name': 'FX Technology Pro 1-X', 'year': '2021'},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredDevices = linuxDevices
        .where((device) => device['name']!
            .toLowerCase()
            .contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Linux Phones'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Suche nach Geräten',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 2.5,
                ),
                itemCount: filteredDevices.length,
                itemBuilder: (context, index) {
                  final device = filteredDevices[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ZustandScreen(
                            workerName: widget.name,
                            deviceName: device['name']!,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              device['name']!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text('Released: ${device['year']}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
