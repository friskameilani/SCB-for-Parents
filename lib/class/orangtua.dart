class Orangtua {
  String username;
  String password;
  String nama;
  String nomorHp;
  String alamat;
  String status;
  String namaAnak;

  Orangtua(
      {this.username,
      this.password,
      this.nama,
      this.nomorHp,
      this.alamat,
      this.status,
      this.namaAnak});

  Orangtua.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    nama = json['nama'];
    nomorHp = json['nomor_Hp'];
    alamat = json['alamat'];
    status = json['status'];
    namaAnak = json['nama_anak'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['nama'] = this.nama;
    data['nomor_Hp'] = this.nomorHp;
    data['alamat'] = this.alamat;
    data['status'] = this.status;
    data['nama_anak'] = this.namaAnak;
    return data;
  }
}