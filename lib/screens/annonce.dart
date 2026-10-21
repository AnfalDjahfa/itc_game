import 'package:flutter/material.dart';

class UserAnnonc extends StatelessWidget{
  const UserAnnonc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Announcements',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            _buildAnnouncementCard(
              clubName: 'IT CLUB',
              postDate: 'Oct 15 • 12:00',
              title: 'Mobile Dev Team Leader',
              description:
                  'We are proud to announce Amina as the Leader of Team Mobile Dev 2025! Congratulations and best of luck! 🚀',
              dateInfo: 'October 15',
              timeInfo: '12:00',
              locationInfo: 'Online ',
              imagePath: 'assets/images/flutter2.jpeg', 
              likesCount: '85',
              commentsCount: '24',
              profileImage: 'assets/images/lightmode.png',
            ),
            const SizedBox(height: 16),

            
            _buildAnnouncementCard(
              clubName: 'IT CLUB',
              postDate: 'Oct 10 • 10:00',
              title: 'Flutter Workshop',
              description:
                  'We are happy to announce our first Flutter workshop. Don\'t miss it!',
              dateInfo: 'October 15',
              timeInfo: '14:00',
              locationInfo: 'local',
              imagePath: 'assets/images/flutter.jpeg', 
              likesCount: '42',
              commentsCount: '15',
              profileImage: 'assets/images/lightmode.png',
            ),
            const SizedBox(height: 16),

            
            _buildAnnouncementCard(
              clubName: 'IT CLUB',
              postDate: 'Oct 5 • 16:30',
              title: 'Hackathon 2026',
              description: 'Get ready for our annual hackathon!',
              dateInfo: 'November 01',
              timeInfo: '09:00',
              locationInfo: 'blida 1 university',
              imagePath: null, 
              likesCount: '120',
              commentsCount: '45',
              profileImage: 'assets/images/lightmode.png',
            ),
          ],
        ),
      ),
    );
  }

 
  Widget _buildAnnouncementCard({
    required String clubName,
    required String postDate,
    required String title,
    required String description,
    required String dateInfo,
    required String timeInfo,
    required String locationInfo,
    String? imagePath,
    required String likesCount,
    required String commentsCount,
    String? profileImage,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red, width: 1.5),
                ),
                child: ClipOval(
                  child: profileImage != null
                      ? Image.asset(profileImage, fit: BoxFit.cover)
                      : const Icon(Icons.group, color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clubName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    postDate,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),

         
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 14,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 14),

          
          _buildDetailRow(Icons.calendar_today_outlined, dateInfo),
          const SizedBox(height: 6),
          _buildDetailRow(Icons.access_time_outlined, timeInfo),
          const SizedBox(height: 6),
          _buildDetailRow(Icons.location_on_outlined, locationInfo),
          const SizedBox(height: 14),

         
          if (imagePath != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
          ],

         
          Row(
            children: [
              const Icon(Icons.favorite, color: Colors.red, size: 20),
              const SizedBox(width: 6),
              Text(
                likesCount,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
              ),
              const Spacer(),
              const Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 20),
              const SizedBox(width: 6),
              Text(
                commentsCount,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  
  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey.shade400, size: 18),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey.shade300,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}