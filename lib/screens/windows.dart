import 'package:flutter/material.dart';
import 'zustand.dart';
class WindowsScreen extends StatefulWidget {
  final String name;
  WindowsScreen({required this.name});

  @override
  _WindowsScreenState createState() => _WindowsScreenState();
}

class _WindowsScreenState extends State<WindowsScreen> {
  final List<Map<String, String>> windowsDevices = [
    {'name': 'Nokia Lumia 520', 'year': '2013'},
    {'name': 'Nokia Lumia 620', 'year': '2013'},
    {'name': 'Nokia Lumia 720', 'year': '2013'},
    {'name': 'Nokia Lumia 920', 'year': '2012'},
    {'name': 'Nokia Lumia 925', 'year': '2013'},
    {'name': 'Nokia Lumia 1020', 'year': '2013'},
    {'name': 'Nokia Lumia 1320', 'year': '2013'},
    {'name': 'Nokia Lumia 1520', 'year': '2013'},
    {'name': 'Microsoft Lumia 435', 'year': '2015'},
    {'name': 'Microsoft Lumia 532', 'year': '2015'},
    {'name': 'Microsoft Lumia 535', 'year': '2014'},
    {'name': 'Microsoft Lumia 540', 'year': '2015'},
    {'name': 'Microsoft Lumia 550', 'year': '2015'},
    {'name': 'Microsoft Lumia 640', 'year': '2015'},
    {'name': 'Microsoft Lumia 640 XL', 'year': '2015'},
    {'name': 'Microsoft Lumia 650', 'year': '2016'},
    {'name': 'Microsoft Lumia 950', 'year': '2015'},
    {'name': 'Microsoft Lumia 950 XL', 'year': '2015'},
    {'name': 'Nokia Lumia Icon', 'year': '2014'},
    {'name': 'Nokia Lumia 930', 'year': '2014'},
    {'name': 'Nokia Lumia 2520', 'year': '2013'},
    {'name': 'Nokia Lumia 730', 'year': '2014'},
    {'name': 'Nokia Lumia 735', 'year': '2014'},
    {'name': 'Nokia Lumia 830', 'year': '2014'},
    {'name': 'Nokia Lumia 610', 'year': '2012'},
    {'name': 'Nokia Lumia 800', 'year': '2011'},
    {'name': 'Nokia Lumia 900', 'year': '2012'},
    {'name': 'HTC Windows Phone 8X', 'year': '2012'},
    {'name': 'HTC Windows Phone 8S', 'year': '2012'},
    {'name': 'Samsung ATIV S', 'year': '2012'},
    {'name': 'Samsung ATIV SE', 'year': '2014'},
    {'name': 'Samsung ATIV S Neo', 'year': '2013'},
    {'name': 'Alcatel OneTouch Fierce XL', 'year': '2016'},
    {'name': 'HP Elite x3', 'year': '2016'},
    {'name': 'BLU Win HD LTE', 'year': '2015'},
    {'name': 'BLU Win JR LTE', 'year': '2015'},
    {'name': 'Acer Liquid M220', 'year': '2015'},
    {'name': 'Acer Liquid Jade Primo', 'year': '2016'},
    {'name': 'Yezz Billy 4.7', 'year': '2014'},
    {'name': 'Archos 40 Cesium', 'year': '2014'},
  ];

  String searchQuery = '';

 @override
  Widget build(BuildContext context) {
    final filteredDevices = windowsDevices
        .where((device) => device['name']!
            .toLowerCase()
            .contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Windows Phones'),
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
