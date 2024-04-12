import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinaFoods/Model/loai_dac_san.dart';
import 'package:vinaFoods/Model/noi_bat.dart';
import 'package:vinaFoods/Service/thu_vien_api.dart';

import 'Model/comment.dart';
import 'Model/dac_san.dart';
import 'Model/hinh_anh.dart';
import 'Model/nguoi_dung.dart';
import 'Model/noi_ban.dart';
import 'Model/tinh_thanh.dart';
import 'Model/vung_mien.dart';
import 'Router/router_config.dart';
import 'Model/CounterModel.dart';
import 'package:provider/provider.dart';



late final SharedPreferences ref;
List<Vung> dsVungMien = [];
List<NguoiDung> dsNguoiDung = [];
List<HinhAnh> dsHinhAnh = [];
List<TinhThanh> dsTinhThanh = [];
List<NoiBan> dsNoiBan = [];
List<DacSan> dsDacSan = [];
List<DacSan> dsDacSanMienBac = [];
List<DacSan> dsDacSanMienTrung = [];
List<DacSan> dsDacSanMienNam = [];
List<LoaiDacSan> dsLoaiDacSan = [];
List<NoiBat> dsDacSanNoiBat = [];
List<DacSan> dsYeuThich = [];
List<Comment> dsComment = [];
late NguoiDung nguoiDung;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD6xZFLLjERzWa0WljNz1Bes4w_YEwLLa8",
          authDomain: "dacsanvietnam-6ee19.firebaseapp.com",
          databaseURL:
          "https://dacsanvietnam-6ee19-default-rtdb.asia-southeast1.firebasedatabase.app",
          projectId: "dacsanvietnam-6ee19",
          storageBucket: "dacsanvietnam-6ee19.appspot.com",
          messagingSenderId: "41890746519",
          appId: "1:41890746519:android:e985a7d3cee3b3e61199d2",
          measurementId: "G-ES189ZW8QH"));

  ref = await SharedPreferences.getInstance();

  // deleteUser("NzUeEuQvJiY9e6SOET96Jajv0Ur2");

  runApp(
      ChangeNotifierProvider(
        create: (context) => addDSLuu(),
        child :const MainApp(),
      ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "App đặc sản",
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 30, 144, 255),
            background: Colors.black,
            brightness: Brightness.dark),
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          // ···
          titleLarge: GoogleFonts.robotoFlex(
            fontSize: 30,
            color: Colors.white,
          ),
          bodyMedium: GoogleFonts.robotoFlex(
            color: Colors.white,
          ),
          displaySmall: GoogleFonts.robotoFlex(
            color: Colors.white,
          ),
        ),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 30, 144, 255),
            background: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          // ···
          titleLarge: GoogleFonts.robotoFlex(
            fontSize: 30,
            color: Colors.black,
          ),
          bodyMedium: GoogleFonts.robotoFlex(
            color: Colors.black,
          ),
          displaySmall: GoogleFonts.robotoFlex(
            color: Colors.black,
          ),
        ),
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
