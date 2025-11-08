import 'package:flutter/material.dart';
import 'app_drawer.dart';

class ChatWithAIPage extends StatelessWidget {
  const ChatWithAIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // Dark background color
      endDrawer: const AppDrawer(),
      appBar: AppBar(

        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Chat With AI',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // TODO: Open menu or drawer
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'What now? Spit it out!',
                  style: TextStyle(
                    color: const Color(0xFFB3FF21), // Neon yellow/green color
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          // AI Persona Chips at the bottom
          Container(
            color: const Color(0xFF2C2C2C), // Dark grey background for the chips section
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildPersonaChip(
                    text: 'Angry GPT',
                    isPremium: false,
                    isSelected: true,
                  ),
                  const SizedBox(width: 8),
                  _buildPersonaChip(
                    text: 'Lola',
                    isPremium: true,
                    isSelected: false,
                  ),
                  const SizedBox(width: 8),
                  _buildPersonaChip(
                    text: 'Mimi',
                    isPremium: true,
                    isSelected: false,
                  ),
                  // Add more chips as needed
                ],
              ),
            ),
          ),

          // Message Input Field
          Container(
            color: const Color(0xFF2C2C2C), // Dark grey background for the input section
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Message with Angry GPT...',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                      filled: true,
                      fillColor: const Color(0xFF1E1E1E),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(
                    Icons.send_rounded,
                    color: Color(0xFFB3FF21), // Neon yellow/green color
                  ),
                  onPressed: () {
                    // TODO: Send message logic
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for AI persona chips
  Widget _buildPersonaChip({
    required String text,
    required bool isPremium,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFB3FF21) : const Color(0xFF333333),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: isSelected ? const Color(0xFFB3FF21) : Colors.transparent,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isPremium) ...[
            const SizedBox(width: 8),
            const Icon(Icons.star, size: 16, color: Colors.yellow),
          ],
        ],
      ),
    );
  }
}