class NilaiAsrama {
  String nis;
  String nama;
  List<Nilai> nilai;

  NilaiAsrama({this.nis, this.nama, this.nilai});

  NilaiAsrama.fromJson(Map<String, dynamic> json) {
    nis = json['nis'];
    nama = json['nama'];
    if (json['nilai'] != null) {
      nilai = new List<Nilai>();
      json['nilai'].forEach((v) {
        nilai.add(new Nilai.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nis'] = this.nis;
    data['nama'] = this.nama;
    if (this.nilai != null) {
      data['nilai'] = this.nilai.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Nilai {
  int tahsin;
  int tahfiz;
  int hafalan;
  int hadistTulis;
  int hadistLisan;
  int mufrodat;
  int doaDanDzikirTulis;
  int doaDanDzikirLisan;
  int asmaulHusna;
  int talim;
  int hafalanSuratPilihan;

  Nilai(
      {this.tahsin,
      this.tahfiz,
      this.hafalan,
      this.hadistTulis,
      this.hadistLisan,
      this.mufrodat,
      this.doaDanDzikirTulis,
      this.doaDanDzikirLisan,
      this.asmaulHusna,
      this.talim,
      this.hafalanSuratPilihan});

  Nilai.fromJson(Map<String, dynamic> json) {
    tahsin = json['Tahsin'];
    tahfiz = json['Tahfiz'];
    hafalan = json['Hafalan'];
    hadistTulis = json['Hadist Tulis'];
    hadistLisan = json['Hadist Lisan'];
    mufrodat = json['Mufrodat'];
    doaDanDzikirTulis = json['Doa dan Dzikir Tulis'];
    doaDanDzikirLisan = json['Doa dan Dzikir Lisan'];
    asmaulHusna = json['Asmaul Husna'];
    talim = json['Talim'];
    hafalanSuratPilihan = json['Hafalan Surat Pilihan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Tahsin'] = this.tahsin;
    data['Tahfiz'] = this.tahfiz;
    data['Hafalan'] = this.hafalan;
    data['Hadist Tulis'] = this.hadistTulis;
    data['Hadist Lisan'] = this.hadistLisan;
    data['Mufrodat'] = this.mufrodat;
    data['Doa dan Dzikir Tulis'] = this.doaDanDzikirTulis;
    data['Doa dan Dzikir Lisan'] = this.doaDanDzikirLisan;
    data['Asmaul Husna'] = this.asmaulHusna;
    data['Talim'] = this.talim;
    data['Hafalan Surat Pilihan'] = this.hafalanSuratPilihan;
    return data;
  }
}