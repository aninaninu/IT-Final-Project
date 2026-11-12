import '../service/user_storage.dart';
import 'package:flutter/material.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = 'Summer';
  String bio = 'Exploring the world, one quest at a time ✨';

@override
void initState() {
  super.initState();
  _loadProfile();
}

Future<void> _loadProfile() async {
  final savedName = await UserStorage.getUsername();
  final savedBio = await UserStorage.getBio();

  if (!mounted) return;

  setState(() {
    userName = savedName;
    bio = savedBio;
  });
}

  // Demo data: replace with actual quest data later.
  final int level = 12;
  final int completedQuests = 18;
  final int streak = 7;
  final int earnedXp = 2450;
  final int targetXp = 5000;

  static const Color darkGreen = Color(0xFF23473D);
  static const Color lightGreen = Color(0xFFE5EEDC);
  static const Color background = Color(0xFFF6F5EF);

  Future<void> _editProfile() async {
    final nameController = TextEditingController(text: userName);
    final bioController = TextEditingController(text: bio);

    final updated = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit Profile'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                maxLength: 30,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: bioController,
                maxLength: 100,
                maxLines: 2,
                decoration: const InputDecoration(labelText: 'Bio'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (nameController.text.trim().isEmpty) {
                return;
              }
              Navigator.pop(dialogContext, true);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );


if (updated == true && mounted) {
  final newName = nameController.text.trim();
  final newBio = bioController.text.trim();

  await UserStorage.saveUsername(newName);
  await UserStorage.saveBio(newBio);

  if (!mounted) return;

  setState(() {
    userName = newName;
    bio = newBio;
  });
}

    nameController.dispose();
    bioController.dispose();
  }

  Widget _statCard(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _achievement(IconData icon, String title) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: Color(0xFFB88A3B)),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(color: darkGreen, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },

          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 42,
                    backgroundColor: lightGreen,
                    child: Icon(
                      Icons.person_outline,
                      size: 46,
                      color: darkGreen,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: darkGreen,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    bio,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: _editProfile,
                    icon: const Icon(Icons.edit_outlined, size: 16),
                    label: const Text('Edit Profile'),
                  ),
                  const SizedBox(height: 22),

                  Row(
                    children: [
                      _statCard('$level', 'Level'),
                      const SizedBox(width: 10),
                      _statCard('$completedQuests', 'Quests'),
                      const SizedBox(width: 10),
                      _statCard('$streak', 'Day Streak'),
                    ],
                  ),
                  const SizedBox(height: 18),

                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Your XP Progress',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: darkGreen,
                              ),
                            ),
                            Text('$earnedXp / $targetXp'),
                          ],
                        ),
                        const SizedBox(height: 12),
                        LinearProgressIndicator(
                          value: earnedXp / targetXp,
                          minHeight: 9,
                          borderRadius: BorderRadius.circular(8),
                          backgroundColor: lightGreen,
                          color: darkGreen,
                        ),
                        const SizedBox(height: 9),
                        const Text(
                          'Keep completing quests to level up!',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Achievements',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: darkGreen,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _achievement(Icons.emoji_events_outlined, 'First Quest'),
                      const SizedBox(width: 10),
                      _achievement(
                        Icons.local_fire_department_outlined,
                        '7-Day Streak',
                      ),
                      const SizedBox(width: 10),
                      _achievement(Icons.star_outline, 'Explorer'),
                    ],
                  ),
                  const SizedBox(height: 24),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Quest Memories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: darkGreen,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: List.generate(3, (index) {
                      return Expanded(
                        child: Container(
                          height: 100,
                          margin: EdgeInsets.only(right: index == 2 ? 0 : 10),
                          decoration: BoxDecoration(
                            color: lightGreen,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(
                            Icons.image_outlined,
                            color: darkGreen,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
