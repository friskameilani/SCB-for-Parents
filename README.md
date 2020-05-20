# SCB For Parents

### Deskripsi Aplikasi
SCB For Parents merupakan aplikasi mobile yang mengambil inspirasi dari IPB For Parents yang bertujuan untuk membantu orangtua dalam memonitor aktivitas dan pembelajaran anak mereka dalam jarak jauh. 

### Ruang Lingkup Aplikasi
Aplikasi SCB for Parents dibangun menggunakan hybrid framework flutter yang dapat dijalankan dalam mobile dengan sistem operasi Android dengan versi minimum 4.1 dan sistem operasi iOS dengan versi minimum 8.0.

### Diagram
#### Use Case Diagram
![alt text](https://github.com/friskameilani/SCB-for-Parents/blob/kabar/use%20case%20diagram.png)
#### Class Diagram
![alt text](https://github.com/friskameilani/SCB-for-Parents/blob/kabar/PSBO%20Class%20Diagram.jpeg)
#### Activity Diagram
![alt text](https://github.com/friskameilani/SCB-for-Parents/blob/kabar/Activity%20Diagram.png)

### Fitur Secara Umum 
1. **SSO Login:**
Orang tua dapat menggunakan email dan password yang diberikan oleh pihak Sekolah Cendekia Baznas untuk melihat aktivitas mereka dengan menggunakan sso dari Humas Sekolah Cendekia Baznas. 
2. **Nilai akademik siswa:** 
Orang tua dapat melihat nilai akademik siswa dari kelas 7, 8 dan 9 (jika ada). Data dan API yang digunakan adalah data dari SIMAK Sekolah Cendekia Baznas. 
3. **Nilai asrama siswa:**
Orang tua dapat melihat nilai asrama siswa dari kelas 7,8 dan 9 (jika ada). Data dan API yang diungakan adalah data dari Asrama Sekolah Cendekia Baznas.
4. **Pelanggaran dan prestasi siswa:**
Orang tua dapat melihat aktivitas dan pelanggaran yang dilakukan oleh anak di sekolah. Data dan API yang digunakan adalah data dari Asrama SCB.
5. **News dan update terbaru Sekolah Cendekia Baznas:**
Orang tua dapat melihat kabar terbaru dan artikel-artikel seputar Sekolah Cendekia Baznas. Data dan API yang digunakan adalah data dari Humas Sekolah Cendekia Baznas Cendekia Baznas. 
6. **Download Sebagai PDF:**
Orang tua dapat download nilai akademik dan non akademik siswa dalam bentuk pdf
7. **Dark Mode:**
Fitur dark mode responsif ketika setting handphone user malam hari. 

### Konsep OOP yang digunakan

#### Abstraction

#### Polymorphism

```dart
class MyApp extends StatelessWidget {
  ...
  @override
    Widget build(BuildContext context) {
    ...
```

Dalam membangun *widget* pada flutter, digunakan konsep [_inheritance_](#inheritance)
dalam pembuatan _widget_ baru. Dalam _superclass_-nya (StatefulWidget atau StatelessWidget),
sudah terdapat fungsi `build()` sebagai _template_. Adanya `@override` dalam potongan kode
di atas merupakan implementasi dari *Polymorphism*, yakni *function overriding* yang kemudian
memungkinkan kita untuk menggunakan fungsi tersebut dengan implementasi yang berbeda dari superclassnya.

#### Inheritance

```dart
class MyApp extends StatelessWidget {
```

Dalam membangun *widget* pada flutter, sebuah kelas akan dibangun dan
melakukan *extends* dari widget yang sudah ada dalam *package* dalam 
flutter, yang berarti setiap pembuatan *widget*/*page* baru, kita membuat
turunan (*inheritance*) dari superclassnya.

#### Encapsulation
```dart
class MyApp extends StatelessWidget {

  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;

  @override
  Widget build(BuildContext context) {
   ...
      home: new FutureBuilder(
          future: jwtOrEmpty,
          builder: (context, snapshot) {
            print(snapshot.hasData);
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
       ...
       }
       ..
    )
  ...
```
Membuat sebuah getter di class MyApp dan digunakan lagi sebagai kondisi saat membuat sebuah Future Builder yang baru.

### Tipe Desain Pengembangan yang digunakan
Pada aplikasi SCB-For-Parents kami menggunakan tiga design pattern dalam pengembangan yaitu:
1. MVC (Model View Controller)
2. Composite Design Pattern
3. Templated Method Design Pattern

#### :capital_abcd: Model View Controller

Model View Controller memisahkan aplikasi menjadi 3 bagian, yaitu View (sebagai tampilan UI), Controller (mengatur logic dan interaksi antara View dan Model) dan Model (sebagai data yang diterima dan diolah). Kami memanfaatkan MVC untuk memudahkan kita dalam memperoleh data dari 3 Backend API yang berbeda.

Pada component Views, kami memanfaatkan dua templates yang disediakan oleh flutter, yaitu class stateful widgets, untuk screen yang dinamis. Pada component Controller, kami membuatclass khusus untuk setiap screen yang dinamis. Dalam setiap class controller berisi HTTP Request untuk memanggil data sesuai dengan logic atau event yang dilakukan dalam screen tersebut.
Pada component Models kita membuat sebuah class untuk menyimpan variabel dari data JSON yang telah di parse untuk digunakan kembali. 

#### :arrow_double_down: Composite Design Pattern
Composite Design Pattern membentuk hirarki objek seperti sebuah struktur tree. Kami menggunakan hierarki tersebut dalam manajemen routing screen/pages dalam aplikasi dan manajemen UI Components dalam sebuah screen. 

#### :arrows_counterclockwise: Templated method
Templated method memungkinkan subclass mendefinisikan ulang langkah-langkah tertentu dari suatu algoritma tanpa mengubah struktur algoritma itu sendiri. Kami menggunakan design pattern tersebut untuk menampilkan nilai akademik siswa, nilai asrama siswa, dan catatan khusus siswa. 

### Kelompok 
- **Rizky Syawal Putra Thahir** (Project Manager & Developer) 
- **Friska Meilani** (Core Developer & UI/UX Designer) 
- **Dhana Dhira** (Core Developer)
- **Elang Surya Prawira** (Developer)
- **Annisa Widia Astuti** (UI/UX)
- **Aan Kunaifi** (UI/UX)

### Cara Menjalankan Aplikasi

1. Check Flutter Environments
```
flutter doctor -v
```
2. Install Flutter dependencies
```
flutter pub get
```
3. Authentication Testing
```
email: kip123@gmail.com
password: 12345678
```
OR
```
email: melan123@gmail.com
password: 12345678
```
