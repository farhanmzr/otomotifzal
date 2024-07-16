import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:otomotifzal/database//database_service.dart';
import 'package:otomotifzal/utils/colors.dart';
import 'package:otomotifzal/utils/helper.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddDataPage extends StatelessWidget {

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Tambah Data Mobil",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Nama Mobil',
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    FormBuilderTextField(
                        name: 'name',
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: "Nama Mobil tidak boleh kosong.")
                        ]),
                        decoration:
                        inputDecoration.copyWith(hintText: "Nama Mobil")),
                    const SizedBox(height: 16),
                    // Lokasi Mobil
                    const Text('Lokasi Mobil',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: black)),
                    const SizedBox(height: 12),
                    FormBuilderTextField(
                        name: 'location',
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: "Lokasi Mobil tidak boleh kosong.")
                        ]),
                        decoration:
                        inputDecoration.copyWith(hintText: "Lokasi Mobil")),
                    const SizedBox(height: 16),
                    // Transmission Mobil
                    const Text('Transmission Mobil',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: black)),
                    const SizedBox(height: 12),
                    FormBuilderTextField(
                        name: 'transmission',
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: "Transmission Mobil tidak boleh kosong.")
                        ]),
                        decoration:
                        inputDecoration.copyWith(hintText: "Tranmission Mobil")),
                    const SizedBox(height: 16),
                    // People Mobil
                    const Text('Kursi Muat Mobil',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: black)),
                    const SizedBox(height: 12),
                    FormBuilderTextField(
                        name: 'people',
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: "Kursi Mobil tidak boleh kosong.")
                        ]),
                        decoration:
                        inputDecoration.copyWith(hintText: "Kursi Muat Mobil")),
                    const SizedBox(height: 16),
                    // Merk Mobil
                    const Text('Merk Mobil',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: black)),
                    const SizedBox(height: 12),
                    FormBuilderTextField(
                        name: 'merk',
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: "Merk Mobil tidak boleh kosong.")
                        ]),
                        decoration:
                        inputDecoration.copyWith(hintText: "Merk Mobil")),
                    const SizedBox(height: 16),
                    // Deskripsi Mobil
                    const Text('Deskripsi Mobil',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: black)),
                    const SizedBox(height: 12),
                    FormBuilderTextField(
                        name: 'desc',
                        maxLines: null,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: "Deskripsi Mobil tidak boleh kosong.")
                        ]),
                        decoration: inputDecoration.copyWith(
                            hintText: "Deskripsi Mobil")),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            color: blue,
                            onPressed: () {
                              print('tapp button');
                              // Validate and save the form values
                              if (_formKey.currentState!.saveAndValidate()) {
                                // Form is valid, you can get the value now
                                final nama = _formKey.currentState!.fields['name']!.value.toString();
                                final location = _formKey.currentState!.fields['location']!.value.toString();
                                final transmission = _formKey.currentState!.fields['transmission']!.value.toString();
                                final people = _formKey.currentState!.fields['people']!.value.toString();
                                final merk = _formKey.currentState!.fields['merk']!.value.toString();
                                final desc = _formKey.currentState!.fields['desc']!.value.toString();
                                addDatatoDatabase(context, nama, location, transmission, people, merk, desc);
                              }
                            },
                            child: const Text('Add Data',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: white)),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ));
  }
}

void addDatatoDatabase(BuildContext context, String nama, String location, String tranmission,
    String people, String merk, String desc) async {

  final firebaseService = DatabaseService();
  firebaseService.createData(nama, location,
      tranmission, people, merk, desc).then((result) {
    if (result == "Success") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Berhasil menambahkan data baru."),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Gagal menambahkan data: $result"),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }).catchError((error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Terjadi kesalahan: $error"),
        duration: const Duration(seconds: 2),
      ),
    );
  });
}
