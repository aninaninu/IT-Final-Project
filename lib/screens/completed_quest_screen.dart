import 'package:flutter/material.dart';
import '../theme/app_colours.dart';

class CompletedQuestsScreen extends StatelessWidget {
  const CompletedQuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quests = [
      {'title': 'Morning Walk', 'xp': '100 XP', 'date': 'Today'},
      {'title': 'Digital Detox', 'xp': '200 XP', 'date': 'Yesterday'},
      {'title': 'Meet a Friend', 'xp': '150 XP', 'date': 'Oct 28'},
    ];

    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(title: const Text('Completed Quests')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Your Achievements',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGreen,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Look how far you have come!',
            style: TextStyle(color: AppColors.gray),
          ),
          const SizedBox(height: 20),
          ...quests.map(
            (quest) => Card(
              color: AppColors.white,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: AppColors.sageGreen,
                  child: Icon(Icons.check_circle, color: AppColors.darkGreen),
                ),
                title: Text(
                  quest['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(quest['date']!),
                trailing: Text(
                  '+${quest['xp']}',
                  style: const TextStyle(
                    color: AppColors.gold,
                    fontWeight: FontWeight.bold,
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
