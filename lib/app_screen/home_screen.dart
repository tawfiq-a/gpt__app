import 'package:app10/app_screen/chat_screen.dart';
import 'package:app10/app_screen/lola_chat.dart';
import 'package:flutter/material.dart';

import 'app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B1B), // Dark background color
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Custom AppBar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // User Profile Image
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/profile.png'), // Placeholder image
                      ),
                      const SizedBox(width: 12),
                      // Greeting Text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Susan',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Hamburger Menu Icon
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AppDrawer(),
                        ),
                      );
                      // TODO: Open drawer or menu
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Main Question/Prompt
              const Text(
                'Who do you want to\nchat with today?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 30),

              // AI Persona Grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85, // Adjust aspect ratio for card height
                children: [
                  _buildPersonaCard(
                    context,
                    icon: 'assets/angry_gpt.png', // Placeholder icon
                    title: 'Angry GPT',
                    description: 'Blunt, sarcastic, and always in a mood. Dare to chat?',
                    isPremium: false,
                    isFree: true,
                    backgroundColor: const Color(0xFF2C2C2C),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (Context) => ChatWithAIPage()));
                    }// Dark grey
                  ),
                  _buildPersonaCard(
                    context,
                    icon: 'assets/book.png', // Placeholder icon
                    title: 'Visit Shop',
                    description: 'Explore books, comics & music',
                    isPremium: false,
                    isFree: false, // No explicit 'Free' tag for Shop
                    backgroundColor: const Color(0xFF2C2C2C),
                  ),
                  _buildPersonaCard(
                    context,
                    icon: 'assets/mimi.png', // Placeholder icon
                    title: 'Mimi',
                    description: 'Flirty, playful, and charming. Enter Mimi\'s world.',
                    isPremium: true,
                    isFree: false,
                    backgroundColor: const Color(0xFF2C2C2C),
                  ),
                  _buildPersonaCard(
                    context,
                    icon: 'assets/lola.png', // Placeholder icon
                    title: 'Lola',
                    description: 'Witty, humorous, and fun. Have a chat and laugh!',
                    isPremium: true,
                    isFree: false,
                    backgroundColor: const Color(0xFF2C2C2C),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (Context) => LolaChat()));
                      }// Dark grey
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Personal Assistant Card
              _buildPersonaCard(
                context,
                icon: 'assets/assistant.png', // Placeholder icon
                title: 'Personal Assistant',
                description: 'Organized, helpful, and always on task. Your smart companion for staying productive and on schedule',
                isPremium: false,
                isFree: false, // No explicit 'Free' or 'Premium' tag
                isLarge: true,
                backgroundColor: const Color(0xFF2C2C2C),
              ),
              const SizedBox(height: 30),

              // Unlock AI+ Features Section
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C2C), // Dark grey background
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Unlock AI+ Features!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildFeatureItem('Unlimited AI Conversations'),
                    _buildFeatureItem('Exclusive AI Personas'),
                    _buildFeatureItem('Early Access to New Features'),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Navigate to Premium subscription page
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB3FF21), // Neon yellow/green color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Go Premium',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, color: Colors.black, size: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement chat functionality
        },
        backgroundColor: const Color(0xFFB3FF21), // Neon yellow/green
        child: const Icon(Icons.mic, color: Colors.black, size: 30), // Placeholder for 'A' icon
      ),
    );
  }

  // Helper widget for AI Persona cards
  Widget _buildPersonaCard(
      BuildContext context, {
        required String icon,
        required String title,
        required String description,
        required bool isPremium,
        required bool isFree,
        bool isLarge = false,
        required Color backgroundColor,
        VoidCallback? onTap,
      }) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: const Color(0xFF2C2C2C)), // Subtle border
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  icon,
                  height: isLarge ? 40 : 30, // Adjust icon size
                  width: isLarge ? 40 : 30,
                ),
                if (isFree)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Free',
                      style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 10),
                    ),
                  ),
                if (isPremium)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDAA520).withOpacity(0.7), // Gold-like color
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Premium',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
              ],
            ),
            SizedBox(height: isLarge ? 20 : 15),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 13,
              ),
              maxLines: isLarge ? 3 : 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for feature list items
  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xFFB3FF21), size: 20),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}