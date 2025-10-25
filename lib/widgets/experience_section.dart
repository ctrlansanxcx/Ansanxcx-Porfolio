import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  final List<Experience> experiences = const [
    Experience(
      role: 'Work Immersion',
      company: 'Krus Na Ligas High School',
      period: 'March 2023 - April 2023',
      description:
          'Editor in charge in our school ID, yearbook, school tarpaulin, and informercial. Distributer of school materials and hygiene kits.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 120,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EXPERIENCE',
            style: GoogleFonts.tomorrow(
              fontSize: isMobile ? 12 : 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 40),
          ...experiences.asMap().entries.map((entry) {
            int index = entry.key;
            Experience exp = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildExperienceItem(exp, index, isMobile),
                if (index < experiences.length - 1)
                  Padding(
                    padding: EdgeInsets.only(
                      left: isMobile ? 30 : 30,
                      top: 30,
                      bottom: 30,
                    ),
                    child: Container(
                      width: 1,
                      height: isMobile ? 40 : 60,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(Experience exp, int index, bool isMobile) {
    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circle Indicator
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: GoogleFonts.tomorrow(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                exp.role,
                style: GoogleFonts.tomorrow(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                exp.period,
                style: GoogleFonts.tomorrow(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                exp.company,
                style: GoogleFonts.tomorrow(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                exp.description,
                style: GoogleFonts.tomorrow(
                  fontSize: 14,
                  height: 1.6,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circle Indicator
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: GoogleFonts.tomorrow(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          exp.role,
                          style: GoogleFonts.tomorrow(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          exp.period,
                          style: GoogleFonts.tomorrow(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      exp.company,
                      style: GoogleFonts.tomorrow(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      exp.description,
                      style: GoogleFonts.tomorrow(
                        fontSize: 15,
                        height: 1.8,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

class Experience {
  final String role;
  final String company;
  final String period;
  final String description;

  const Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.description,
  });
}
