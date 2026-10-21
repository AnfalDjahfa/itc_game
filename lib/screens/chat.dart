import 'package:flutter/material.dart';

class UserChat extends StatelessWidget{
  const UserChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
           
            SizedBox(
              height: 35,
              child: Image.asset(
                'assets/images/logoITc.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Chats',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            
            Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF121212),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: const Color(0xFFE50914), width: 1.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 18),
                          const SizedBox(width: 8),
                          const Text(
                            'Messages',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE50914),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text('3', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                 
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.group_outlined, color: Colors.grey.shade400, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          'Groups',
                          style: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE50914),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text('1', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
           
            Expanded(
              child: ListView(
                children: [
                  _buildChatItem(
                    name: 'Anfel',
                    message: 'Hey, are you coming to the meeting today?',
                    time: '14:32',
                    unreadCount: '2',
                    avatarPath: 'assets/images/avatar.jpeg',
                  ),
                  const SizedBox(height: 12),
                  _buildChatItem(
                    name: 'IT Community',
                    message: 'Hadia: The new update is live! 🎉',
                    time: '13:18',
                    unreadCount: '5',
                    avatarPath: 'assets/images/darkedmode.png',
                  ),
                   const SizedBox(height: 12),
                  _buildChatItem(
                    name: 'Maria',
                    message: 'Thank youuu! ',
                    time: '09:12',
                    unreadCount: '1',
                    avatarPath: 'assets/images/Maria.jpg'
                  ),
                 
                  const SizedBox(height: 12),
                  _buildChatItem(
                    name: 'Study Group',
                    message: 'Aya: I shared the notes for BDD.',
                    time: '10:23',
                    unreadCount: '3',
                    isGroup: true,
                  ),
                 
                ],
              ),
            ),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFE50914),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  
  Widget _buildChatItem({
    required String name,
    required String message,
    required String time,
    required String unreadCount,
    String? avatarPath,
    bool isGroup = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          
          Stack(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.grey.shade800,
                backgroundImage: avatarPath != null ? AssetImage(avatarPath) : null,
                child: avatarPath == null
                    ? Icon(isGroup ? Icons.group : Icons.person, color: Colors.white, size: 28)
                    : null,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE50914),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF1E1E1E), width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 14),
          
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    if (isGroup) ...[
                      const SizedBox(width: 6),
                      Icon(Icons.group_outlined, color: Colors.grey.shade400, size: 16),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE50914),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      unreadCount,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade600,
                    size: 14,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}