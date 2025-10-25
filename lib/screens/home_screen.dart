import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/aboutme_section.dart';
import 'package:portfolio_website/widgets/achievements_section.dart';
import 'package:portfolio_website/widgets/experience_section.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/contact_section.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _achievementsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _aboutMeKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    final RenderBox? renderBox;

    if (section == 'HOME') {
      renderBox = _heroKey.currentContext?.findRenderObject() as RenderBox?;
    } else if (section == 'EXPERIENCE') {
      renderBox =
          _experienceKey.currentContext?.findRenderObject() as RenderBox?;
    } else if (section == 'CERTIFICATION') {
      renderBox =
          _achievementsKey.currentContext?.findRenderObject() as RenderBox?;
    } else if (section == 'ABOUT ME') {
      renderBox = _aboutMeKey.currentContext?.findRenderObject() as RenderBox?;
    } else if (section == 'CONTACT') {
      renderBox = _contactKey.currentContext?.findRenderObject() as RenderBox?;
    } else {
      return;
    }

    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero).dy;
      _scrollController.animateTo(
        _scrollController.offset + position,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData(textTheme: GoogleFonts.tomorrowTextTheme());

    return Scaffold(
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(
                  key: _heroKey,
                  onNavigate: _scrollToSection, // Pass scroll callback
                ),

                ExperienceSection(key: _experienceKey),
                AchievementsSection(key: _achievementsKey),
                AboutMeSection(key: _aboutMeKey),
                ContactSection(key: _contactKey),
              ],
            ),
          ),
          // Fixed navigation bar
          CustomNavigationBar(onNavigate: _scrollToSection),
        ],
      ),
    );
  }
}
