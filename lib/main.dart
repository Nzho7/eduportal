import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/subjects/subjects_screen.dart';
import 'screens/timetable/timetable_screen.dart';
import 'screens/absence/qr_scanner_screen.dart';

void main() {
  runApp(const EduPortalApp());
}

class EduPortalApp extends StatelessWidget {
  const EduPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduPortal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0019FF),
          primary: const Color(0xFF0019FF),
          secondary: const Color(0xFFFFD600),
          tertiary: const Color(0xFF00E5FF),
          surface: const Color(0xFFF7F8FC),
          background: const Color(0xFFF7F8FC),
          error: const Color(0xFFFF4081),
          onPrimary: Colors.white,
          onSecondary: const Color(0xFF1A237E),
          onSurface: const Color(0xFF2C3E50),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF546E7A)),
          bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF37474F)),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xFF2C3E50),
        ),
        cardTheme: const CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          color: Colors.white,
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        ProfileScreen.routeName: (_) => const ProfileScreen(),
        SubjectsScreen.routeName: (_) => const SubjectsScreen(),
        TimeTableScreen.routeName: (_) => const TimeTableScreen(),
        QRScannerScreen.routeName: (_) => const QRScannerScreen(),
      },
    );
  }
}
