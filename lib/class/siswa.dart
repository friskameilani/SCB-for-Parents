import 'dart:convert';

class Siswa {
  String nama;
  String nis;
  String nisn;
  String jenisKelamin;
  String tempatTanggalLahir;
  String kelas;
  String asrama;
  List<NilaiAkademik> nilaiAkademik = new List<NilaiAkademik>();

  Siswa(
      {this.nama,
      this.nis,
      this.nisn,
      this.jenisKelamin,
      this.tempatTanggalLahir,
      this.kelas,
      this.asrama,
      this.nilaiAkademik});

  Siswa.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    nis = json['nis'];
    nisn = json['nisn'];
    jenisKelamin = json['jenis_kelamin'];
    tempatTanggalLahir = json['tempat_tanggal_lahir'];
    kelas = json['kelas'];
    asrama = json['asrama'];
    if (json['nilaiAkademik'] != null) {
      json['nilaiAkademik'].forEach((v) {
        nilaiAkademik.add(new NilaiAkademik.fromJson(v));
      });
    }
    if(nilaiAkademik!=null) print(nilaiAkademik);
    else print('kosong');
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
    if (this.nilaiAkademik != null) {
      data['nilaiAkademik'] =
          this.nilaiAkademik.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NilaiAkademik {
  Map<String, dynamic> nilai;
  static List<String> matpel = [
    'Pendidikan Agama dan Budi Pekerti',
    'Pendidikan Kewarganegaraan' ,
    'Bahasa dan Sastra Indonesia' ,
    'Bahasa Inggris',
    'Matematika',
    'Ilmu Pengetahuan Alam',
    'Ilmu Pengetahuan Sosial',
    'Seni Budaya',
    'Pendidikan Jasmani, Olahraga dan Kesehatan',
    'Tahfiz Tahsin Quran',
    'Teknologi Informasi dan Komunikasi',
    'Bahasa dan Sastra Sunda',
    'Prakarya',
    'Bahasa Arab',
  ];

  NilaiAkademik({this.nilai});

  NilaiAkademik.fromJson(Map<String, dynamic> json) {
    nilai = jsonDecode(jsonEncode(json));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    for(int i=0; i<matpel.length; i++)
      data[matpel[i]] = nilai[matpel[i]];
    return data;
  }

  static String getVerdict(int nilai){
    String res;
    if(nilai >= 92)
      res = "A";
    else if(nilai >= 82)
      res = "B";
    else if (nilai >= 72)
      res = "C";
    else res = "D";
    return res;
  }
}
