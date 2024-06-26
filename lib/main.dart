import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinaFoods/Model/loai_dac_san.dart';

import 'Model/Provider.dart';
import 'Model/comment.dart';
import 'Model/dac_san.dart';
import 'Model/hinh_anh.dart';
import 'Model/nguoi_dung.dart';
import 'Model/noi_ban.dart';
import 'Model/noi_bat.dart';
import 'Model/tinh_thanh.dart';
import 'Model/vung_mien.dart';
import 'Router/router_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
List<DacSan> dsGanBan = [];
List<Comment> dsComment = [];
String selectedLanguage = 'vi'; // Ngôn ngữ được chọn mặc định
String idGuest = 'VnnNKzwRoqOItzRC4PPg4mkaRcc2';
const domain = "http://192.168.88.41/dacsan/api/"; // https://cntt199.000webhostapp.com/api/
late NguoiDung nguoiDung;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyD6xZFLLjERzWa0WljNz1Bes4w_YEwLLa8',
    appId: '1:41890746519:android:e985a7d3cee3b3e61199d2',
    messagingSenderId: '41890746519',
    projectId: 'dacsanvietnam-6ee19',
    authDomain: 'dacsanvietnam-6ee19.firebaseapp.com',
    databaseURL:
        'https://dacsanvietnam-6ee19-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'dacsanvietnam-6ee19.appspot.com',
    measurementId: 'G-ES189ZW8QH',
  ));

  ref = await SharedPreferences.getInstance();

  // deleteUser("NzUeEuQvJiY9e6SOET96Jajv0Ur2");

  runApp(ChangeNotifierProvider(
    create: (context) => ThuVienProvider(),
    child: const MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MainAppState? state = context.findAncestorStateOfType<_MainAppState>();
    state?.setLocale(newLocale);
  }
  static String getLocale() {
    return "";
  }
}

class _MainAppState extends State<MainApp> {
  Locale? _locale;

  getLocale() {
    return _locale?.languageCode;
  }

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
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
