//PODO MODEL TO BE USED LATER IN PROFILE
class Siswa {
  String nama;
  String jenisKelamin;
  String nis;
  String nisn;
  String tempatTanggalLahir;
  String kelas;
  String asrama;
  List<int> nilai;

  Siswa(
      {this.nama,
      this.jenisKelamin,
      this.nis,
      this.nisn,
      this.tempatTanggalLahir,
      this.kelas,
      this.asrama,
      this.nilai});

  factory Siswa.fromJson(Map<String, dynamic> parsedJson) {
    return Siswa(
        nama: parsedJson['nama'],
        jenisKelamin: parsedJson['jenis_kelamin'],
        nis: parsedJson['nis'],
        nisn: parsedJson['nisn'],
        tempatTanggalLahir: parsedJson['tempat_tanggal_lahir'],
        kelas: parsedJson['kelas'],
        asrama: parsedJson['asrama'],
        nilai: parsedJson['nilai']);
  }
}
