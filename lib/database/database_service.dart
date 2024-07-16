import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otomotifzal/model/mobil_model.dart';

class DatabaseService {

  final dataMobilDB = FirebaseFirestore.instance.collection("dataMobil");

  //Create Data
  Future<String> createData(String name, String location, String transmission, String people, String merk, String desc) async {
    try {
      final docRef = dataMobilDB.doc();
      final docID = docRef.id;
      final user = MobilModel(id: docID, name: name, location: location, transmission: transmission,
          people: people, merk: merk, desc: desc);
      await docRef.set(user.toMap());
      return "Success";
    } catch (e) {
      log(e.toString());
      return 'Error: ${e.toString()}';
    }
  }

  //Read Data
  Future<List<MobilModel>> fetchListData() async {

    List<MobilModel> mobilList = [];
    try {
      QuerySnapshot snapshot = await dataMobilDB.get();
      snapshot.docs.forEach((doc) {
        mobilList.add(MobilModel(
          id: doc.id,
          name: doc['name'],
          location: doc['location'],
          transmission: doc['transmission'],
          people: doc['people'],
          merk: doc['merk'],
          desc: doc['desc'],
        ));
      });
      return mobilList;
    } catch (e) {
      print('Error fetching mobil models: $e');
      return [];
    }
  }

  //Update Data
  Future<String> updateData(MobilModel data) async {

    try {
      await dataMobilDB.doc(data.id).update(data.toMap());
      log("Success edit data");
      return "Success";
    } catch (e) {
      log(e.toString());
      return 'Error: ${e.toString()}';
    }
  }

  //Delete Data
  Future<String> deleteData(String id) async {

    try {
      dataMobilDB.doc(id).delete();
      log("Success deleted data");
      return "Success";
    } catch (e) {
      log(e.toString());
      return 'Error: ${e.toString()}';
    }
  }

}