//PODO MODEL TO BE USED LATER IN PROFILE
class Orangtua {
  String nama;
  String nomorHp;
  String alamat;
  String jenisKelamin;
  Orangtua({this.nama, this.nomorHp, this.alamat, this.jenisKelamin});

  factory Orangtua.fromJson(Map<String, dynamic> parsedJson) {
    return Orangtua(
        nama: parsedJson['nama'],
        nomorHp: parsedJson['nomor_Hp'],
        alamat: parsedJson['alamat'],
        jenisKelamin: parsedJson['jenis_kelamin']);
  }
}
