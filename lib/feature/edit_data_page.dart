import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:otomotifzal/database//database_service.dart';
import 'package:otomotifzal/model/mobil_model.dart';
import 'package:otomotifzal/utils/colors.dart';
import 'package:otomotifzal/utils/helper.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EditDataPage extends StatefulWidget {
  final MobilModel mobil;

  EditDataPage({required this.mobil});

  @override
  EditDataPageState createState() => EditDataPageState();
}

class EditDataPageState extends State<EditDataPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    // Initialize form fields with existing data
    _formKey.currentState?.fields['name']?.didChange(widget.mobil.name);
    _formKey.currentState?.fields['location']?.didChange(widget.mobil.location);
    _formKey.currentState?.fields['transmission']?.didChange(widget.mobil.transmission);
    _formKey.currentState?.fields['people']?.didChange(widget.mobil.people);
    _formKey.currentState?.fields['merk']?.didChange(widget.mobil.merk);
    _formKey.currentState?.fields['desc']?.didChange(widget.mobil.desc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Data Mobil",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nama Mobil',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),
                FormBuilderTextField(
                    name: 'name',
                    initialValue: widget.mobil.name,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: "Nama Mobil tidak boleh kosong.")
                    ]),
                    decoration: inputDecoration.copyWith(hintText: "Nama Mobil")),
                const SizedBox(height: 16),
                // Location Mobil
                const Text('Location Mobil',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: black)),
                const SizedBox(height: 12),
                FormBuilderTextField(
                    name: 'location',
                    initialValue: widget.mobil.location,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: "Location Mobil tidak boleh kosong.")
                    ]),
                    decoration: inputDecoration.copyWith(hintText: "Location Mobil")),
                const SizedBox(height: 16),
                // Tranmission Mobil
                const Text('Transmission Mobil',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: black)),
                const SizedBox(height: 12),
                FormBuilderTextField(
                    name: 'transmission',
                    initialValue: widget.mobil.transmission,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: "Transmission Mobil tidak boleh kosong.")
                    ]),
                    decoration: inputDecoration.copyWith(hintText: "Transmission Mobil")),
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
                    initialValue: widget.mobil.people,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: "Kursi Mobil tidak boleh kosong.")
                    ]),
                    decoration: inputDecoration.copyWith(hintText: "Kursi Muat Mobil")),
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
                    initialValue: widget.mobil.merk,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: "Merk Mobil tidak boleh kosong.")
                    ]),
                    decoration: inputDecoration.copyWith(hintText: "Merk Mobil")),
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
                    initialValue: widget.mobil.desc,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: "Deskripsi Mobil tidak boleh kosong.")
                    ]),
                    decoration:
                    inputDecoration.copyWith(hintText: "Deskripsi Mobil")),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        color: blue,
                        onPressed: () {
                          // Validate and save the form values
                          if (_formKey.currentState!.saveAndValidate()) {
                            // Form is valid, you can get the value now
                            final nama = _formKey
                                .currentState!.fields['name']!.value
                                .toString();
                            final location = _formKey
                                .currentState!.fields['location']!.value
                                .toString();
                            final transmission = _formKey
                                .currentState!.fields['transmission']!.value
                                .toString();
                            final people = _formKey
                                .currentState!.fields['people']!.value
                                .toString();
                            final merk = _formKey
                                .currentState!.fields['merk']!.value
                                .toString();
                            final desc = _formKey
                                .currentState!.fields['desc']!.value
                                .toString();

                            final dataMobil = MobilModel(id: widget.mobil.id, location: location,
                                transmission: transmission, people: people, name: nama, merk: merk, desc: desc);
                            updateDatatoDatabase(context, dataMobil);
                          }
                        },
                        child: const Text('Perbarui Data',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: white)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void updateDatatoDatabase(BuildContext context, MobilModel data) {
  final firebaseService = DatabaseService();
  firebaseService.updateData(data).then((result) {
    if (result == "Success") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Berhasil memperbaharui data."),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Gagal memperbaharui data: $result"),
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
