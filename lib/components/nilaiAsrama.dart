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
    "Hafalan Surat Pilihan",
    "Barber Shop Literasi",
    "Tata Boga",
    "Sol dan Aneka Sepatu dan Sandal",
    "Pertukangan dan Elektronik",
    "Tata Busana",
    "Crafting, Sablon dan Grafiti"
  ];

  static List<NilaiAsrama> nilaiAsrama= new List<NilaiAsrama>();

  static List<NilaiAsrama> setMap(){
    for(int i=0; i<aspek.length; i++){
      NilaiAsrama a;
      j(a);
      a.aspek = aspek[i];
      nilaiAsrama.add(a);
    }
    print(nilaiAsrama);
    return(nilaiAsrama);
  }

  static int j(NilaiAsrama a) => a.nilaiAsrama = rng.nextInt(100);
}

class NilaiAsrama{
  int nilaiAsrama;
  String aspek;
}
