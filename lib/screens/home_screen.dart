import 'package:flutter/material.dart';
import '../theme/app_colours.dart';
import 'completed_quest_screen.dart';
import 'quest_selection_screen.dart';
import 'blocked_apps_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSoloMode = true;
  int points = 980;

  void _openScreen(Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 16,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Summer!',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Ready for a quest today?',
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '⭐ $points',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    _buildModeTab('Solo Mode', true),
                    _buildModeTab('Friendship Mode', false),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.image, size: 40, color: Colors.grey),
                          const SizedBox(height: 10),
                          ...List.generate(3, (i) {
                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 6),
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Quest Level ${i + 1}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 10),
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              _buildMenuItem(
                Icons.lock,
                'Blocked Apps',
                () => _openScreen(const BlockedAppsScreen()),
              ),
              _buildMenuItem(
                Icons.history,
                'Previous Quest',
                () => _openScreen(const QuestSelectionScreen()),
              ),
              _buildMenuItem(
                Icons.camera_alt,
                'Recent Memories',
                () => _openScreen(const ProfileScreen()),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1F483D),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Quests'),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Done',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 1) {
            _openScreen(const QuestSelectionScreen());
          } else if (index == 2) {
            _openScreen(const CompletedQuestsScreen());
          } else if (index == 3) {
            _openScreen(const ProfileScreen());
          }
        },
      ),
    );
  }

  Widget _buildModeTab(String title, bool isSolo) {
    final isActive = isSoloMode == isSolo;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSoloMode = isSolo;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
