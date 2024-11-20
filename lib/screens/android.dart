import 'package:flutter/material.dart';
import 'zustand.dart';
class AndroidScreen extends StatefulWidget {
  final String name;
  AndroidScreen({required this.name});

  @override
  _AndroidScreenState createState() => _AndroidScreenState();
}

class _AndroidScreenState extends State<AndroidScreen> {
  final List<Map<String, String>> androidDevices = [
    {'name': 'Samsung Galaxy S8', 'year': '2017'},
    {'name': 'Samsung Galaxy Note 8', 'year': '2017'},
    {'name': 'Google Pixel 2', 'year': '2017'},
    {'name': 'Huawei Mate 10', 'year': '2017'},
    {'name': 'OnePlus 5', 'year': '2017'},
    {'name': 'LG G6', 'year': '2017'},
    {'name': 'Xiaomi Mi 6', 'year': '2017'},
    {'name': 'Sony Xperia XZ Premium', 'year': '2017'},
    {'name': 'HTC U11', 'year': '2017'},
    {'name': 'Moto Z2 Force', 'year': '2017'},
    {'name': 'Samsung Galaxy S9', 'year': '2018'},
    {'name': 'Samsung Galaxy Note 9', 'year': '2018'},
    {'name': 'Google Pixel 3', 'year': '2018'},
    {'name': 'Huawei P20 Pro', 'year': '2018'},
    {'name': 'OnePlus 6', 'year': '2018'},
    {'name': 'LG V40 ThinQ', 'year': '2018'},
    {'name': 'Xiaomi Mi 8', 'year': '2018'},
    {'name': 'Sony Xperia XZ3', 'year': '2018'},
    {'name': 'HTC U12+', 'year': '2018'},
    {'name': 'Pocophone F1', 'year': '2018'},
    {'name': 'Samsung Galaxy S10', 'year': '2019'},
    {'name': 'Samsung Galaxy Note 10', 'year': '2019'},
    {'name': 'Google Pixel 4', 'year': '2019'},
    {'name': 'Huawei P30 Pro', 'year': '2019'},
    {'name': 'OnePlus 7 Pro', 'year': '2019'},
    {'name': 'LG G8 ThinQ', 'year': '2019'},
    {'name': 'Xiaomi Mi 9', 'year': '2019'},
    {'name': 'Sony Xperia 1', 'year': '2019'},
    {'name': 'Asus ROG Phone II', 'year': '2019'},
    {'name': 'Realme X2 Pro', 'year': '2019'},
    {'name': 'Samsung Galaxy S20', 'year': '2020'},
    {'name': 'Samsung Galaxy Note 20', 'year': '2020'},
    {'name': 'Google Pixel 5', 'year': '2020'},
    {'name': 'Huawei P40 Pro', 'year': '2020'},
    {'name': 'OnePlus 8 Pro', 'year': '2020'},
    {'name': 'LG V60 ThinQ', 'year': '2020'},
    {'name': 'Xiaomi Mi 10', 'year': '2020'},
    {'name': 'Sony Xperia 1 II', 'year': '2020'},
    {'name': 'Asus Zenfone 7 Pro', 'year': '2020'},
    {'name': 'Realme 7 Pro', 'year': '2020'},
    {'name': 'Samsung Galaxy S21', 'year': '2021'},
    {'name': 'Samsung Galaxy Note 21', 'year': '2021'},
    {'name': 'Google Pixel 6', 'year': '2021'},
    {'name': 'Huawei Mate 40 Pro', 'year': '2021'},
    {'name': 'OnePlus 9 Pro', 'year': '2021'},
    {'name': 'Xiaomi Mi 11', 'year': '2021'},
    {'name': 'Sony Xperia 1 III', 'year': '2021'},
    {'name': 'Asus ROG Phone 5', 'year': '2021'},
    {'name': 'Realme GT', 'year': '2021'},
  ];

  String searchQuery = '';

@override
  Widget build(BuildContext context) {
    final filteredDevices = androidDevices
        .where((device) => device['name']!
            .toLowerCase()
            .contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Android Devices'),
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
