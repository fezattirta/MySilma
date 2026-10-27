import 'package:flutter/material.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const Color primaryGreen = Color(0xFF006B4F);
  static const Color darkGreen = Color(0xFF004D3B);
  static const Color backgroundColor = Color(0xFFFAF8FF);
  static const Color fieldColor = Color(0xFFF0F1FF);
  static const Color accentGreen = Color(0xFFE4F3B2);
  static const Color textDark = Color(0xFF172238);
  static const Color textGrey = Color(0xFF62666D);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // ==========================================
  // LOGIN
  // ==========================================

  void _login() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    // CATATAN:
    // Bagian ini belum memverifikasi akun ke database.
    // Hubungkan ke API autentikasi sebelum digunakan
    // sebagai sistem login produksi.

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
  }

  // ==========================================
  // NAVIGASI REGISTER
  // ==========================================


  // ==========================================
  // LUPA PASSWORD
  // ==========================================

  void _forgotPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Fitur lupa kata sandi belum dihubungkan.',
        ),
      ),
    );
  }

  // ==========================================
  // FACE ID
  // ==========================================

  void _faceIdLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Fitur biometrik belum diaktifkan.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 18,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 4),

                  // LOGO MYSILMA
                  _buildLogo(),

                  const SizedBox(height: 12),

                  // LABEL APLIKASI
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: accentGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'MY SILMA SPORT CENTER ARENA',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        color: darkGreen,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // JUDUL
                  const Text(
                    'Selamat Datang! 👋',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      color: textDark,
                      letterSpacing: -0.5,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // DESKRIPSI
                  const Text(
                    'Sistem Informasi Lapangan & Komunitas Badminton,\n'
                    'Booking slot & Mabar lebih mudah.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      height: 1.7,
                      color: textGrey,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // KARTU LOGIN
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(
                      14,
                      17,
                      14,
                      14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.035),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // EMAIL / WHATSAPP
                        _buildLabel(
                          'No. WhatsApp / Email',
                        ),

                        const SizedBox(height: 7),

                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontSize: 11,
                            color: textDark,
                          ),
                          decoration: _inputDecoration(
                            hint:
                                'cth. 08123456789 atau nama@email.com',
                            icon: Icons.alternate_email,
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty) {
                              return 'Email atau nomor WhatsApp wajib diisi.';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 13),

                        // LABEL PASSWORD
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            _buildLabel('Kata Sandi'),

                            GestureDetector(
                              onTap: _forgotPassword,
                              child: const Text(
                                'Lupa Kata Sandi?',
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: primaryGreen,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 7),

                        // INPUT PASSWORD
                        TextFormField(
                          controller: passwordController,
                          obscureText: _obscurePassword,
                          style: const TextStyle(
                            fontSize: 11,
                            color: textDark,
                          ),
                          decoration: _inputDecoration(
                            hint: 'Masukkan kata sandi akun',
                            icon: Icons.lock_outline,
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword =
                                      !_obscurePassword;
                                });
                              },
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 17,
                                color: const Color(0xFF78827D),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty) {
                              return 'Kata sandi wajib diisi.';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 11),

                        // INGAT SAYA DAN FACE ID
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 22,
                              child: Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                                activeColor: primaryGreen,
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5),
                                ),
                                materialTapTargetSize:
                                    MaterialTapTargetSize
                                        .shrinkWrap,
                              ),
                            ),

                            const SizedBox(width: 5),

                            const Expanded(
                              child: Text(
                                'Ingat Saya di perangkat ini',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Color(0xFF454B52),
                                ),
                              ),
                            ),

                            InkWell(
                              onTap: _faceIdLogin,
                              borderRadius:
                                  BorderRadius.circular(20),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF1F9EE),
                                  borderRadius:
                                      BorderRadius.circular(20),
                                  border: Border.all(
                                    color:
                                        const Color(0xFFDCEBD8),
                                    width: 0.6,
                                  ),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.face,
                                      size: 13,
                                      color: primaryGreen,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Face ID',
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight:
                                            FontWeight.w700,
                                        color: primaryGreen,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // TOMBOL LOGIN
                        SizedBox(
                          width: double.infinity,
                          height: 42,
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryGreen,
                              foregroundColor: Colors.white,
                              elevation: 2,
                              shadowColor:
                                  primaryGreen.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Masuk ke Akun',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 7),
                                Icon(
                                  Icons.person_outline,
                                  size: 17,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 13),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================
  // WIDGET LABEL
  // ==========================================

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: textDark,
      ),
    );
  }

  // ==========================================
  // INPUT DECORATION
  // ==========================================

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        fontSize: 10,
        color: Color(0xFF9AA0A8),
      ),
      prefixIcon: Icon(
        icon,
        size: 17,
        color: const Color(0xFF78827D),
      ),
      suffixIcon: suffix,
      filled: true,
      fillColor: fieldColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 12,
      ),
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          color: primaryGreen,
          width: 1.2,
        ),
      ),
      errorStyle: const TextStyle(
        fontSize: 10,
      ),
    );
  }

  // ==========================================
  // LOGO MYSILMA
  // ==========================================

  Widget _buildLogo() {
    return Container(
      width: 57,
      height: 57,
      decoration: BoxDecoration(
        color: darkGreen,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: const Color(0xFFD8E8B1),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: darkGreen.withOpacity(0.12),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/mysilma_logo.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.sports_tennis,
                  color: Color(0xFFDCECA8),
                  size: 28,
                ),
                SizedBox(height: 1),
                Text(
                  'MYSILMA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}