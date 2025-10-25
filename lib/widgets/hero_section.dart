import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroSection extends StatelessWidget {
  final void Function(String) onNavigate; // Callback to scroll

  const HeroSection({Key? key, required this.onNavigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // Centered Content
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Main heading
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'Hello World!',
                          textStyle: GoogleFonts.tomorrow(
                            color: Colors.white,
                            fontSize: isMobile ? 40 : 80,
                            fontWeight: FontWeight.w500,
                            letterSpacing: isMobile ? 1 : 2,
                            height: 1.1,
                          ),
                          speed: const Duration(milliseconds: 120),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),

                    const SizedBox(height: 20),

                    // Description
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: isMobile ? double.infinity : 700,
                      ),
                      child: Column(
                        children: [
                          _buildDescriptionText(
                            'I am John Tristan Ballesteros currently pursuing a bachelor\'s degree in',
                            isMobile,
                          ),
                          _buildDescriptionText(
                            'information technology majoring in mobile and web applications.',
                            isMobile,
                          ),
                          _buildDescriptionText(
                            'Experienced in project management and software development.',
                            isMobile,
                          ),
                          _buildDescriptionText(
                            'Passionate about technology, teamwork, and learning new things.',
                            isMobile,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // CTA Button
                    _buildCTAButton(isMobile),

                    SizedBox(height: isMobile ? 50 : 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionText(String text, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: GoogleFonts.geologica(
          color: Colors.white,
          fontSize: isMobile ? 13 : 18,
          fontWeight: FontWeight.w400,
          height: 1.6,
          letterSpacing: 0.4,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildCTAButton(bool isMobile) {
    return InkWell(
      onTap: () {
        onNavigate('EXPERIENCE'); // Scroll to Experience section
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 40,
          vertical: isMobile ? 12 : 18,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Text(
          'Get Started Now',
          style: TextStyle(
            color: Colors.black,
            fontSize: isMobile ? 13 : 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
