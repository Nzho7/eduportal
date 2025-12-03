import 'package:flutter/material.dart';

import '../../widgets/edu_portal_bottom_bar.dart';

class TimeTableScreen extends StatelessWidget {
  static const String routeName = '/timetable';

  const TimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                      'Time Table',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your weekly schedule',
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
            child: ListView(
              padding: const EdgeInsets.all(20),
              physics: const BouncingScrollPhysics(),
              children: [
                _buildDaySection(context, 'Monday'),
                const SizedBox(height: 8),
                _buildClassItem(
                  context,
                  '09:00 AM',
                  'Data Structures',
                  'Hall A',
                  const Color(0xFFFF4081),
                ),
                _buildClassItem(
                  context,
                  '11:00 AM',
                  'Algorithms',
                  'Lab 3',
                  const Color(0xFF7C4DFF),
                ),

                const SizedBox(height: 24),
                _buildDaySection(context, 'Tuesday'),
                const SizedBox(height: 8),
                _buildClassItem(
                  context,
                  '10:00 AM',
                  'Web Development',
                  'Room 204',
                  const Color(0xFF00BFA5),
                ),
                _buildClassItem(
                  context,
                  '02:00 PM',
                  'Mobile Dev',
                  'Lab 1',
                  const Color(0xFF0019FF),
                ),

                const SizedBox(height: 24),
                _buildDaySection(context, 'Wednesday'),
                const SizedBox(height: 8),
                _buildClassItem(
                  context,
                  '09:00 AM',
                  'Operating Systems',
                  'Lab 2',
                  const Color(0xFFFF6E40),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const EduPortalBottomBar(selectedIndex: 2),
    );
  }

  Widget _buildDaySection(BuildContext context, String day) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        day,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildClassItem(
    BuildContext context,
    String time,
    String subject,
    String room,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: color, width: 6)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.access_time, color: color, size: 20),
        ),
        title: Text(
          subject,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('$time • $room'),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      ),
    );
  }
}
