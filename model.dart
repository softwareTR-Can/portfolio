import 'dart:convert';

CustomerModel customerModelFromMap(String str) =>
    CustomerModel.fromMap(json.decode(str));

String customerModelToMap(CustomerModel data) => json.encode(data.toMap());

class CustomerModel {
  CustomerModel({
    this.musteriNo,
    this.musteriAdi,
    this.adresi,
    this.paraBirimi,
    this.vadeSekli,
    this.grubu,
  });

  final String musteriNo;
  final String musteriAdi;
  final String adresi;
  final String paraBirimi;
  final String vadeSekli;
  final String grubu;

  factory CustomerModel.fromMap(Map<String, dynamic> json) => CustomerModel(
        musteriNo: json["MusteriNo"],
        musteriAdi: json["MusteriAdi"],
        adresi: json["Adresi"],
        paraBirimi: json["ParaBirimi"],
        vadeSekli: json["Vadesi"],
        grubu: json["MusteriGrubu"],
      );

  Map<String, dynamic> toMap() => {
        "MusteriNo": musteriNo,
        "MusteriAdi": musteriAdi,
        "Adresi": adresi,
        "ParaBirimi": paraBirimi,
        "Vadesi": vadeSekli,
        "MusteriGrubu": grubu,
      };
}
