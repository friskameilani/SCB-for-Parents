class Siswa {
  String nama;
  String nis;
  String nisn;
  String jenisKelamin;
  String tempatTanggalLahir;
  String kelas;
  String asrama;
  Nilai nilai;

  Siswa(
      {this.nama,
      this.nis,
      this.nisn,
      this.jenisKelamin,
      this.tempatTanggalLahir,
      this.kelas,
      this.asrama,
      this.nilai});

  Siswa.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    nis = json['nis'];
    nisn = json['nisn'];
    jenisKelamin = json['jenis_kelamin'];
    tempatTanggalLahir = json['tempat_tanggal_lahir'];
    kelas = json['kelas'];
    asrama = json['asrama'];
    nilai = json['nilai'] != null ? new Nilai.fromJson(json['nilai']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['nis'] = this.nis;
    data['nisn'] = this.nisn;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tempat_tanggal_lahir'] = this.tempatTanggalLahir;
    data['kelas'] = this.kelas;
    data['asrama'] = this.asrama;
    if (this.nilai != null) {
      data['nilai'] = this.nilai.toJson();
    }
    return data;
  }
}

class Nilai {
  List<List<int>> l;

  Nilai({l});

  Nilai.fromJson(Map<String, dynamic> json) {
    for(int i=1; i<=6; i++){
      if(json[i.toString()] != null){
        l.add(json[i.toString()]);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    for(int i=1; i<=6; i++){
      data[i.toString()] = this.l[i-1];
    }

    return data;
  }
}