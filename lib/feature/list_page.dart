import 'package:flutter/material.dart';
import 'package:otomotifzal/database/database_service.dart';
import 'package:otomotifzal/feature/detail_page.dart';
import 'package:otomotifzal/feature/edit_data_page.dart';
import 'package:otomotifzal/model/mobil_model.dart';

class ListPage extends StatefulWidget {
  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  // Define variables or properties here
  List<MobilModel> dataList = []; // Example list to hold data

  final DatabaseService firebaseService = DatabaseService();

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch initial data when the widget is initialized
  }

  // Asynchronous with doesn't return any value
  Future<void> fetchData() async {
    try {
      List<MobilModel> data = await firebaseService.fetchListData();
      setState(() {
        dataList = data;
      });
    } catch (error) {
      // Handle error if fetching data fails
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Daftar Mobil",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      )),
      body: _listDataUI(),
    );
  }

  Widget _listDataUI() {
    if (dataList.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(), // Circular loading indicator
            SizedBox(height: 16), // Spacer between indicator and text
            Text('Loading data...'), // Text indicating loading
          ],
        ),
      );
    } else {
      return RefreshIndicator(
        onRefresh: () => fetchData(), // Pull to refresh callback
        child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            MobilModel mobil = dataList[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(mobil: mobil),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon or Image on the left
                      const Icon(
                        Icons.car_rental, // Replace with your icon
                        size: 40,
                        color: Colors.blue, // Replace with desired color
                      ),
                      const SizedBox(width: 12), // Adjust as needed for spacing

                      // Text and other content in a Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mobil.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Merk: ${mobil.merk}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              mobil.desc,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),

                      // More Icon with PopupMenuButton
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert),
                        onSelected: (value) {
                          if (value == 'edit') {
                            _navigateToEditPage(context, mobil);
                          } else if (value == 'delete') {
                            _showDeleteConfirmationDialog(context, mobil);
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'edit',
                            child: ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('Edit'),
                            ),
                          ),
                          const PopupMenuItem<String>(
                            value: 'delete',
                            child: ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Delete'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }

  void _navigateToEditPage(BuildContext context, MobilModel mobil) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditDataPage(mobil: mobil),
      ),
    );

    fetchData();
  }

  void _showDeleteConfirmationDialog(BuildContext context, MobilModel mobil) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete ${mobil.name}?"),
          content: const Text("Are you sure you want to delete this item?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Delete"),
              onPressed: () {
                _deleteMobil(context, mobil);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteMobil(BuildContext context, MobilModel mobil) async {
    final firebaseService = DatabaseService();
    String result = await firebaseService.deleteData(mobil.id);
    if (result == "Success") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Data berhasil dihapus."),
          duration: Duration(
              seconds: 2), // Optional: Duration of the SnackBar display
        ),
      );
      fetchData();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Data gagal dihapus : $result"),
          duration: const Duration(
              seconds: 2), // Optional: Duration of the SnackBar display
        ),
      );
    }
  }
}
