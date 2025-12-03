import 'package:flutter/material.dart';
import '../../widgets/edu_portal_bottom_bar.dart';

class SubjectsScreen extends StatelessWidget {
  static const String routeName = '/subjects';

  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final crossAxisCount = size.width > 600 ? 3 : 2;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Container(
            height: size.height * 0.2,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF0019FF), Color(0xFF00E5FF)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subjects',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your enrolled courses',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: [
                _buildSubjectCard(
                  context,
                  'Data Structures',
                  Icons.account_tree,
                  const Color(0xFFFF4081),
                ),
                _buildSubjectCard(
                  context,
                  'Algorithms',
                  Icons.functions,
                  const Color(0xFF7C4DFF),
                ),
                _buildSubjectCard(
                  context,
                  'Web Development',
                  Icons.language,
                  const Color(0xFF00BFA5),
                ),
                _buildSubjectCard(
                  context,
                  'Operating Systems',
                  Icons.memory,
                  const Color(0xFFFF6E40),
                ),
                _buildSubjectCard(
                  context,
                  'Software Eng.',
                  Icons.engineering,
                  const Color(0xFF8D6E63),
                ),
                _buildSubjectCard(
                  context,
                  'Mobile Dev',
                  Icons.phone_android,
                  const Color(0xFF0019FF),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const EduPortalBottomBar(selectedIndex: 1),
    );
  }

  Widget _buildSubjectCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color.withOpacity(0.2), color.withOpacity(0.05)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2C3E50),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
