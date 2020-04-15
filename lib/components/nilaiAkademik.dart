import 'dart:math';

class Siswa{
  static var rng = Random();
  static var matpel = [
    "Pendidikan Agama Islam",
    "Pendidikan Pancasila dan Kewarganegaraan",
    "Bahasa Indonesia",
    "Matematika",
    "Fisika",
    "Biologi",
    "Kimia",
    "Ilmu Pengetahuan Sosial",
    "Bahasa Arab",
    "Pendidikan Jasmani, Olahraga, dan Kesehatan",
    "Seni Budaya dan Keterampilan"
  ];

  static List<Nilai> nilai= new List<Nilai>(matpel.length);
  
  static List<Nilai> setMap(){
    for(int i=0; i<matpel.length; i++){
      nilai[i].nilai = rng.nextInt(100);
      nilai[i].matpel = matpel[i];
    }
    return(nilai);
  }
}

class Nilai{
  int nilai;
  String matpel;
}
