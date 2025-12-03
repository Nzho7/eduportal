import 'package:flutter/material.dart';
import '../widgets/edu_portal_bottom_bar.dart';
import '../widgets/glass_container.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final headerHeight = (size.height * 0.22).clamp(180.0, 300.0);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FC),
      body: Stack(
        children: [
          // 1. CUSTOM HEADER WITH WAVE
          ClipPath(
            clipper: _ProfileHeaderClipper(),
            child: Container(
              height: headerHeight + 80,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF2962FF),
                    Color(0xFF00E5FF),
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const CircleAvatar(
                                  radius: 24,
                                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                "Hi, Nzho",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 2. SCROLLABLE CONTENT (Floating Cards & ID)
          SingleChildScrollView(
            padding: EdgeInsets.only(top: headerHeight + 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      _MenuCard(
                        title: "Absence",
                        icon: Icons.center_focus_strong,
                        iconColor: Color(0xFF0019FF),
                      ),
                      _MenuCard(
                        title: "Time Table",
                        icon: Icons.assignment,
                        iconColor: Color(0xFFFFD600),
                      ),
                      _MenuCard(
                        title: "Subjects",
                        icon: Icons.book,
                        iconColor: Color(0xFF7C4DFF),
                      ),
                      _MenuCard(
                        title: "Assignment",
                        icon: Icons.school,
                        iconColor: Color(0xFF00BFA5),
                      ),
                      _MenuCard(
                        title: "Grades",
                        icon: Icons.grade,
                        iconColor: Color(0xFFFF4081),
                      ),
                      _MenuCard(
                        title: "Library",
                        icon: Icons.local_library,
                        iconColor: Color(0xFF00E5FF),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "ID card",
                    style: TextStyle(
                      color: Color(0xFF5E35B1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                const SizedBox(height: 12),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF7986CB),
                        Color(0xFFD500F9),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.blue, width: 2),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "EduPortal",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 20,
                        child: Container(
                          height: 80,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.white, width: 2),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/profile.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 30,
                        bottom: 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Nzho Nahro Jalal",
                              style: TextStyle(
                                color: Color(0xFFFFD600),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "ID : nn441220035",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const EduPortalBottomBar(selectedIndex: 3),
    );
  }
}

// HELPER WIDGETS

class _MenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;

  const _MenuCard({
    required this.title,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: 110,
      margin: const EdgeInsets.only(right: 12, bottom: 10),
      blur: 12,
      color: Colors.white.withOpacity(0.4),
      padding: EdgeInsets.zero,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      iconColor.withOpacity(0.2),
                      iconColor.withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: iconColor.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(icon, color: iconColor, size: 28),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.7);
    var controlPoint1 = Offset(size.width * 0.25, size.height * 0.85);
    var endPoint1 = Offset(size.width * 0.5, size.height * 0.75);

    var controlPoint2 = Offset(size.width * 0.75, size.height * 0.65);
    var endPoint2 = Offset(size.width, size.height * 0.8);

    path.quadraticBezierTo(
        controlPoint1.dx, controlPoint1.dy,
        endPoint1.dx, endPoint1.dy
    );
    path.quadraticBezierTo(
        controlPoint2.dx, controlPoint2.dy,
        endPoint2.dx, endPoint2.dy
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}