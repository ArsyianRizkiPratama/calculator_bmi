import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor:
            primaryColor, // untuk membuat screen lain memiliki warna yang sama juga seperti data screen
        //Pengaturan appbar di bawah merupakan pengaturan untuk semua appbar di setiap screen
        appBarTheme: const AppBarTheme(
            // #00a0e21 adalah warna heksadesimal yang digunakan
            backgroundColor: primaryColor),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:
          const BmiDataScreen(), //halaman yang di tampilkan pertama saat aplikasi di jalankan
    );
  }
}
