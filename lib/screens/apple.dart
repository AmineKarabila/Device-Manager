import 'package:flutter/material.dart';
import 'zustand.dart';
class AppleScreen extends StatefulWidget {
  final String name;
  AppleScreen({required this.name});

  @override
  _AppleScreenState createState() => _AppleScreenState();
}

class _AppleScreenState extends State<AppleScreen> {
  final List<Map<String, String>> appleDevices = [
    {'name': 'iPhone 2G', 'year': '2007'},
    {'name': 'iPhone 3G', 'year': '2008'},
    {'name': 'iPhone 3GS', 'year': '2009'},
    {'name': 'iPhone 4', 'year': '2010'},
    {'name': 'iPhone 4S', 'year': '2011'},
    {'name': 'iPhone 5', 'year': '2012'},
    {'name': 'iPhone 5C', 'year': '2013'},
    {'name': 'iPhone 5S', 'year': '2013'},
    {'name': 'iPhone 6', 'year': '2014'},
    {'name': 'iPhone 6 Plus', 'year': '2014'},
    {'name': 'iPhone 6S', 'year': '2015'},
    {'name': 'iPhone 6S Plus', 'year': '2015'},
    {'name': 'iPhone SE (1st generation)', 'year': '2016'},
    {'name': 'iPhone 7', 'year': '2016'},
    {'name': 'iPhone 7 Plus', 'year': '2016'},
    {'name': 'iPhone 8', 'year': '2017'},
    {'name': 'iPhone 8 Plus', 'year': '2017'},
    {'name': 'iPhone X', 'year': '2017'},
    {'name': 'iPhone XS', 'year': '2018'},
    {'name': 'iPhone XS Max', 'year': '2018'},
    {'name': 'iPhone XR', 'year': '2018'},
    {'name': 'iPhone 11', 'year': '2019'},
    {'name': 'iPhone 11 Pro', 'year': '2019'},
    {'name': 'iPhone 11 Pro Max', 'year': '2019'},
    {'name': 'iPhone SE (2nd generation)', 'year': '2020'},
    {'name': 'iPhone 12', 'year': '2020'},
    {'name': 'iPhone 12 Mini', 'year': '2020'},
    {'name': 'iPhone 12 Pro', 'year': '2020'},
    {'name': 'iPhone 12 Pro Max', 'year': '2020'},
    {'name': 'iPhone 13', 'year': '2021'},
    {'name': 'iPhone 13 Mini', 'year': '2021'},
    {'name': 'iPhone 13 Pro', 'year': '2021'},
    {'name': 'iPhone 13 Pro Max', 'year': '2021'},
    {'name': 'iPhone SE (3rd generation)', 'year': '2022'},
    {'name': 'iPhone 14', 'year': '2022'},
    {'name': 'iPhone 14 Plus', 'year': '2022'},
    {'name': 'iPhone 14 Pro', 'year': '2022'},
    {'name': 'iPhone 14 Pro Max', 'year': '2022'},
    {'name': 'iPad', 'year': '2010'},
    {'name': 'iPad 2', 'year': '2011'},
    {'name': 'iPad (3rd generation)', 'year': '2012'},
    {'name': 'iPad (4th generation)', 'year': '2012'},
    {'name': 'iPad Air', 'year': '2013'},
    {'name': 'iPad Mini', 'year': '2012'},
    {'name': 'iPad Mini 2', 'year': '2013'},
    {'name': 'iPad Air 2', 'year': '2014'},
    {'name': 'iPad Mini 3', 'year': '2014'},
    {'name': 'iPad Mini 4', 'year': '2015'},
    {'name': 'iPad Pro (9.7-inch)', 'year': '2016'},
    {'name': 'iPad Pro (12.9-inch)', 'year': '2015'},
    {'name': 'iPad (5th generation)', 'year': '2017'},
    {'name': 'iPad (6th generation)', 'year': '2018'},
    {'name': 'iPad (7th generation)', 'year': '2019'},
    {'name': 'iPad (8th generation)', 'year': '2020'},
    {'name': 'iPad (9th generation)', 'year': '2021'},
    {'name': 'iPad Pro (11-inch)', 'year': '2018'},
    {'name': 'iPad Pro (12.9-inch, 3rd generation)', 'year': '2018'},
    {'name': 'iPad Air (4th generation)', 'year': '2020'},
    {'name': 'iPad Mini (6th generation)', 'year': '2021'},
  ];

  String searchQuery = '';


  @override
  Widget build(BuildContext context) {
    final filteredDevices = appleDevices
        .where((device) => device['name']!
            .toLowerCase()
            .contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('iOS Devices'),
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