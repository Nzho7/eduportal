import 'package:flutter/material.dart';
import '../../widgets/glass_container.dart';

class AssignmentDetailScreen extends StatelessWidget {
  static const String routeName = '/assignment-detail';

  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;

  const AssignmentDetailScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Assignment Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color1, color2],
              ),
            ),
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Due: Tomorrow, 11:59 PM",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: GlassContainer(
                    margin: const EdgeInsets.only(top: 20),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white.withOpacity(0.9),
                    blur: 20,
                    width: double.infinity,
                    child: ListView(
                      padding: const EdgeInsets.all(24),
                      children: [
                        const Text(
                          "Instructions",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Detailed Requirements:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "1. Review the lecture notes.\n2. Complete the coding exercises.\n3. Record a 5-minute video explaining your code.\n4. Upload the video and the source code zip file.",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: FilledButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.upload_file),
                            label: const Text("Submit Assignment"),
                            style: FilledButton.styleFrom(
                              backgroundColor: color1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
