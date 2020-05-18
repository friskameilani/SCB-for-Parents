class NilaiAsrama {
  String nis,
      nama,
      aspek,
      tahsin,
      tahfiz,
      hafalan,
      hadistTulis,
      hadistLisan,
      mufrodat,
      doaDzikirTulis,
      doaDzikirLisan,
      asmaulHusna,
      talim,
      hafalanSuratPilihan;

  NilaiAsrama(
      this.nis,
      this.nama,
      this.aspek,
      this.tahsin,
      this.tahfiz,
      this.hafalan,
      this.hadistTulis,
      this.hadistLisan,
      this.mufrodat,
      this.doaDzikirTulis,
      this.doaDzikirLisan,
      this.asmaulHusna,
      this.talim,
      this.hafalanSuratPilihan);

  NilaiAsrama.fromJson(Map<String, dynamic> json) {
    nis = json['nis'];
    nama = json['nama'];
    aspek = json['aspek'];
    tahsin = json['aspek']['tahsin'];
    tahfiz = json['aspek']['tahfiz'];
    hafalan = json['aspek']['hafalan'];
    hadistTulis = json['aspek']['hadistTulis'];
    hadistLisan = json['aspek']['hadistLisan'];
    mufrodat = json['aspek']['mufrodat'];
    doaDzikirTulis = json['aspek']['doaDzikirTulis'];
    doaDzikirLisan = json['aspek']['doaDzikirLisan'];
    asmaulHusna = json['aspek']['asmaulHusna'];
    talim = json['aspek']['talim'];
    hafalanSuratPilihan = json['aspek']['hafalanSuratPilihan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nis'] = this.nis;
    data['nama'] = this.nama;
    data['aspek'] = this.aspek;
    data['aspek']['tahsin'] = this.tahsin;
    data['aspek']['tahfiz'] = this.tahfiz;
    data['aspek']['hafalan'] = this.hafalan;
    data['aspek']['hadistTulis'] = this.hadistTulis;
    data['aspek']['hadistLisan'] = this.hadistLisan;
    data['aspek']['mufrodat'] = this.mufrodat;
    data['aspek']['doaDzikirTulis'] = this.doaDzikirTulis;
    data['aspek']['doaDzikirLisan'] = this.doaDzikirLisan;
    data['aspek']['asmaulHusna'] = this.asmaulHusna;
    data['aspek']['talim'] = this.talim;
    data['aspek']['hafalanSuratPilihan'] = this.hafalanSuratPilihan;

    return data;
  }
}
