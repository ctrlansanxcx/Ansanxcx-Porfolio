import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AchievementsSection extends StatefulWidget {
  const AchievementsSection({Key? key}) : super(key: key);

  @override
  State<AchievementsSection> createState() => _AchievementsSectionState();
}

class _AchievementsSectionState extends State<AchievementsSection> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<Achievement> achievements = [
    Achievement(
      title: 'Fortinet Certified Fundamentals in Cybersecurity',
      organization: 'Fortinet Training Institute',
      description:
          'Gained foundational knowledge in cybersecurity principles and practices.',
      year: 'May 16, 2025 - May 16, 2027',
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    // Adjust viewport for mobile
    _pageController = PageController(viewportFraction: isMobile ? 0.85 : 0.35);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 60 : 120),
      color: Colors.black,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'CERTIFICATION AND ACHIEVEMENTS',
                        style: GoogleFonts.tomorrow(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 3,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildNavButtons(),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CERTIFICATION AND ACHIEVEMENTS',
                        style: GoogleFonts.tomorrow(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 3,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      _buildNavButtons(),
                    ],
                  ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: isMobile ? 370 : 400,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: achievements.length,
              itemBuilder: (context, index) {
                return _buildAchievementCard(
                  achievements[index],
                  index,
                  isMobile,
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              achievements.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildNavButton(Icons.arrow_back, () {
          if (_currentPage > 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        }),
        const SizedBox(width: 15),
        _buildNavButton(Icons.arrow_forward, () {
          if (_currentPage < achievements.length - 1) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        }),
      ],
    );
  }

  Widget _buildNavButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildAchievementCard(
    Achievement achievement,
    int index,
    bool isMobile,
  ) {
    bool isActive = index == _currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Transform.scale(
        scale: isActive ? 1.0 : 0.9,
        child: Opacity(
          opacity: isActive ? 1.0 : 0.5,
          child: Container(
            padding: EdgeInsets.all(isMobile ? 25 : 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      achievement.year,
                      style: GoogleFonts.tomorrow(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      achievement.title,
                      style: GoogleFonts.tomorrow(
                        fontSize: isMobile ? 20 : 28,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      achievement.organization,
                      style: GoogleFonts.tomorrow(
                        fontSize: isMobile ? 12 : 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  achievement.description,
                  style: GoogleFonts.tomorrow(
                    fontSize: isMobile ? 13 : 14,
                    height: 1.6,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Achievement {
  final String title;
  final String organization;
  final String description;
  final String year;

  Achievement({
    required this.title,
    required this.organization,
    required this.description,
    required this.year,
  });
}
