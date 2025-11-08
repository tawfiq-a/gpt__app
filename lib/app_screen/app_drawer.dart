import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1E1E1E), // Dark background color
      child: Column(
        children: <Widget>[
          // Use a ListView for scrollable menu items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const SizedBox(height: 60), // Space from the top

                // New Chat Menu Item
                _buildDrawerItem(
                  icon: Icons.edit_outlined,
                  text: 'New Chat',
                  onTap: () {
                    // TODO: Implement navigation to new chat
                    Navigator.pop(context); // Close the drawer
                  },
                ),

                // History Menu Item
                _buildDrawerItem(
                  icon: Icons.history,
                  text: 'History',
                  onTap: () {
                    // TODO: Implement navigation to history
                    Navigator.pop(context);
                  },
                ),

                const Divider(color: Color(0xFF424242)), // Divider

                // Terms Menu Item
                _buildDrawerItem(
                  icon: Icons.info_outline,
                  text: 'Terms',
                  onTap: () {
                    // TODO: Implement navigation to terms
                    Navigator.pop(context);
                  },
                ),

                // Privacy Menu Item
                _buildDrawerItem(
                  icon: Icons.lock_outline,
                  text: 'Privacy',
                  onTap: () {
                    // TODO: Implement navigation to privacy
                    Navigator.pop(context);
                  },
                ),

                // Settings Menu Item
                _buildDrawerItem(
                  icon: Icons.settings_outlined,
                  text: 'Settings',
                  onTap: () {
                    // TODO: Implement navigation to settings
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),

          // User Profile Section at the bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  // Placeholder for user's profile image
                  // Make sure 'assets/profile_susan.png' exists and is declared in pubspec.yaml
                  backgroundImage: AssetImage('assets/profile_susan.png'),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Susan Flores',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for a single drawer item
  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 24),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
    );
  }
}