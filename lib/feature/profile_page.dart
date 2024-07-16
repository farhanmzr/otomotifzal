import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Halaman Profile",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          )
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            ListTile(
              title: Text(
                'Nama',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                'Afrizal Shahizidan Faviannafi',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ListTile(
              title: Text(
                'NIM',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                'A12.2020.06342',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ListTile(
              title: Text(
                'Location',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                'Semarang, Indonesia',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
