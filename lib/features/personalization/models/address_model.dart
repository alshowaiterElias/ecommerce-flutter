import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String neighborhood;
  bool selectedAddress;

  AddressModel(
      {required this.name,
      required this.phoneNumber,
      required this.street,
      required this.city,
      required this.neighborhood,
      required this.id,
      this.selectedAddress = true});

  static AddressModel empty() => AddressModel(
      name: "",
      phoneNumber: "",
      street: "",
      city: "",
      id: "",
      neighborhood: "");

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "PhoneNumber": phoneNumber,
      "Name": name,
      "Street": street,
      "City": city,
      "Neighborhood": neighborhood,
      "SelectedAddress": selectedAddress
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
        name: data["Name"] as String,
        phoneNumber: data["PhoneNumber"] as String,
        street: data["Street"] as String,
        city: data["City"] as String,
        neighborhood: data["Neighborhood"] as String,
        id: data["Id"] as String,
        selectedAddress: data["SelectedAddress"] as bool);
  }

  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return AddressModel(
        selectedAddress: data["SelectedAddress"] as bool,
        name: data["Name"] ?? "",
        neighborhood: data["Neighborhood"] ?? "",
        phoneNumber: data["PhoneNumber"] ?? "",
        street: data["Street"] ?? "",
        city: data["City"] ?? "",
        id: snapshot.id);
  }

  @override
  String toString() {
    return '$street, $neighborhood, $city';
  }
}
