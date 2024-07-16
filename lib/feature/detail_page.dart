import 'package:flutter/material.dart';
import 'package:otomotifzal/model/mobil_model.dart';

class DetailPage extends StatelessWidget {
  final MobilModel mobil;

  DetailPage({required this.mobil});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mobil.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailCard(
              title: 'Location',
              value: mobil.location,
            ),
            _buildDetailCard(
              title: 'Transmission',
              value: mobil.transmission,
            ),
            _buildDetailCard(
              title: 'People Capacity',
              value: mobil.people,
            ),
            _buildDetailCard(
              title: 'Merk',
              value: mobil.merk,
            ),
            _buildDetailCard(
              title: 'Description',
              value: mobil.desc,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard({required String title, required String value}) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

}