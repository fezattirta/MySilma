import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';
import 'widgets/bottom_nav.dart';


void main() {
  runApp(const MySilmaApp());
}

class MySilmaApp extends StatelessWidget {
  const MySilmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MySILMA',
      theme: AppTheme.data,

      // Halaman pertama adalah Login
      home: const LoginScreen(),
    );
  }
}

// ==========================================
// HALAMAN UTAMA MYSILMA
// ==========================================

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          // BERANDA
          LoginScreen(),
        ],
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

// ==========================================
// HALAMAN BOOKING SEMENTARA
// ==========================================

class _BookingPlaceholder extends StatelessWidget {
  const _BookingPlaceholder();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppTheme.primaryLight,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.calendar_month_rounded,
                  color: AppTheme.primary,
                  size: 40,
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'Booking Lapangan',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Pilih lapangan favoritmu dan lakukan booking dengan mudah.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.textGrey,
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman daftar lapangan
                  // dapat ditambahkan di sini.
                },
                child: const Text('Cari Lapangan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
