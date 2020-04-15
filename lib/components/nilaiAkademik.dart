import 'dart:math';

class Siswa{
  static var rng = Random();
  static List<String> matpel = [
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

  static List<Nilai> nilai= new List<Nilai>();
  
  static List<Nilai> setMap(){
    for(int i=0; i<matpel.length; i++){
      Nilai a;
      j(a);
      a.matpel = matpel[i];
      nilai.add(a);
    }
    print(nilai);
    return(nilai);
  }

  static int j(Nilai a) => a.nilai = rng.nextInt(100);
}

class Nilai{
  int nilai;
  String matpel;
}
