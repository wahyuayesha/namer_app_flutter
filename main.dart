// Memasukan package yang dibutuhkan aplikasi
import 'package:english_words/english_words.dart'; // Paket bahasa inggris
import 'package:flutter/material.dart'; // Paket untuk tampilan UI (material UI)
import 'package:provider/provider.dart'; // Paket untuk interasi aplikasi

//
void main() {
  runApp(MyApp());
}

// Membuat abstrak aplikasi dari statelessWidget (template aplikasi), aplikasinya bernama MyApp
class MyApp extends StatelessWidget {
  const MyApp(
      {super.key}); // Menunjukan bahwa aplikasi ini akan tetap, tidak berubah setelah di-build

  @override // Mengganti nilai lama yang sudah ada di template, dengan nilai-nilai yang baru (replace / overwrite)
  Widget build(BuildContext context) {
    // Fungsi build adalah fungsi yang membangun UI (mengatur posisi widget, membuat teks, dst)
    // ChangeNotifierProvider mendengarkan/mendeteksi semua interaksi yang terjadi di aplikasi
    return ChangeNotifierProvider(
      create: (context) =>
          MyAppState(), // Memebuat satu state bernama MyAppState
      child: MaterialApp(
        // Pada state ini menggunakan style desain dari MaterialUI
        title: 'Namer App', // Diberi judul Namer App
        theme: ThemeData(
          // Data tema aplikasi diberi warna deepOrange
          useMaterial3: true, // Versi materialUI yang dipakai versi 3
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home:
            MyHomePage(), // Nama halaman "MyHomeState" yang menggunakan state "MyAppState"
      ),
    );
  }
}

// Mendefinisikan isi MyAppState
class MyAppState extends ChangeNotifier {
  // State MyAppState diisi dengan 2 kata random yang digabung. Kata random tsb disimpan dalam variable WordPair
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      // base (Canvas) dari layout
      body: Column(
        // Di atas scaffold ada body. Body nya, diberi kolom
        children: [
          // di dalam kolom, diberi teks
          Text('A random idea:'),
          Text(appState.current
              .asLowerCase), // Mengambil random yecy dari appState pada variabel WordPair Current, lalu diubah menjadi huruf keil demua dan ditampilkan sebagai teks
          
          // Membuat button timbul didalam body
          ElevatedButton(
             // Fungsi yang dieksekusi ketika button ditekan
              onPressed: () {
                print('Button Pressed!'); // Menampilkan teks 'Button Pressed' pada terminal ketika button ditekan
              },
              child: Text('Next'), // Menampilkan teks Next didalam button
          ),

        ],
      ),
    );
  }
}
