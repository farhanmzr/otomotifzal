class MobilModel {
  final String id;
  final String name;
  final String location;
  final String transmission;
  final String people;
  final String merk;
  final String desc;

  MobilModel({required this.id, required this.name, required this.location, required this.transmission
    , required this.people, required this.merk, required this.desc});

  Map<String, dynamic> toMap() => {
    "id": id, "name": name, "location": location, "transmission": transmission, "people": people, "merk": merk, "desc": desc
  };
}