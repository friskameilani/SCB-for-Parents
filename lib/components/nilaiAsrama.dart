import 'dart:math';

class AspekAsrama{
  static var rng = Random();
  static List<String> aspek = [
    "Tahsin",
    "Tahfiz",
    "Hafalan",
    "Hadist (Tulis)",
    "Hadist (Lisan)",
    "Mufrodat",
    "Do'a dan Dzikir (Tulis)",
    "Do'a dan Dzikir (Lisan)",
    "Asmaul Husna",
    "Ta'lim",
    "Hafalan Surat Pilihan"
  ];

  static List<Nilai> nilai= new List<Nilai>();
  
  static List<Nilai> setMap(){
    for(int i=0; i<aspek.length; i++){
      Nilai a;
      j(a);
      a.aspek = aspek[i];
      nilai.add(a);
    }
    print(nilai);
    return(nilai);
  }

  static int j(a) => a.nilai = rng.nextInt(100);
}

class Nilai{
  int nilai;
  String aspek;
}
