import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../../widgets/glass_container.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen()),
  );
}

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF651FFF),
                  Color(0xFF4527A0),
                  Color(0xFF120526),
                ],
                stops: [0.0, 0.45, 1.0],
              ),
            ),
          ),

          // 2. TOP BLUE LAYER (The Wave)
          ClipPath(
            clipper: _HeaderWaveClipper(),
            child: Container(
              height: size.height * 0.6,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF448AFF),
                    Color(0xFF2962FF),
                    Color(0xFF0039CB),
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: size.height - MediaQuery.of(context).padding.top,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.15),

                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'EDU\n',
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF1A237E),
                                  height: 0.9,
                                  letterSpacing: -1.0,
                                ),
                              ),
                              TextSpan(
                                text: 'Portal',
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFFFFD600),
                                  height: 0.9,
                                  letterSpacing: -1.0,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: size.height * 0.08),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const _LabeledTextField(
                              label: 'Email or Name',
                              keyboardType: TextInputType.emailAddress,
                            ),

                            const SizedBox(height: 24),

                            const _LabeledTextField(
                              label: 'Password',
                              obscureText: true,
                            ),

                            const SizedBox(height: 40),

                            SizedBox(
                              height: 55,
                              child: FilledButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 2,
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LabeledTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType? keyboardType;

  const _LabeledTextField({
    required this.label,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        GlassContainer(
          blur: 8,
          color: const Color(0xFFF5F5F5).withOpacity(0.9),
          padding: EdgeInsets.zero,
          child: TextField(
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: const TextStyle(color: Colors.black87, fontSize: 16),
            decoration: InputDecoration(
              filled: false,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}

class _HeaderWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height * 0.75);

    var controlPoint = Offset(size.width * 0.35, size.height);
    var endPoint = Offset(size.width, size.height * 0.6);

    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
