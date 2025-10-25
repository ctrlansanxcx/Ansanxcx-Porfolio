import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          // --- ABOUT SECTION ---
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: isMobile ? 60 : 120,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ABOUT ME',
                  style: GoogleFonts.tomorrow(
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: isMobile ? 30 : 60),
                isMobile
                    ? Column(
                        children: [
                          _buildProfileImage(isMobile),
                          const SizedBox(height: 30),
                          _buildAboutText(isMobile),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildProfileImage(isMobile),
                          const SizedBox(width: 80),
                          Expanded(child: _buildAboutText(isMobile)),
                        ],
                      ),
              ],
            ),
          ),

          // --- EDUCATION ---
          _buildEducationSection(isMobile),

          // --- TECHNICAL SKILLS ---
          _buildTechnicalSkillsSection(isMobile),

          // --- PROJECTS ---
          _buildProjectsSection(isMobile),

          // --- ORGANIZATIONS ---
          _buildOrganizationSection(isMobile),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // SECTION BUILDERS
  // -------------------------------------------------------------

  Widget _buildProfileImage(bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 350,
      height: isMobile ? 300 : 450,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/profile.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutText(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'John Tristan Ballesteros',
          style: GoogleFonts.tomorrow(
            fontSize: isMobile ? 26 : 48,
            fontWeight: FontWeight.bold,
            height: 1.2,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Hi! I’m an aspiring IT professional passionate about developing innovative and secure digital solutions. I enjoy exploring different areas of technology — from software development and project management to cybersecurity and database administration. I’m currently pursuing a Bachelor’s degree in Information Technology, majoring in Mobile and Web Application Development at National University – Manila. In my free time, I love reading fictional books, learning new things, and staying updated with the latest tech trends. I’m always eager to take on new challenges and collaborate with others to create impactful solutions. ',
          style: GoogleFonts.tomorrow(
            fontSize: isMobile ? 14 : 16,
            height: 1.8,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'I served as the project manager and lead developer of Maduro, a fruit ripeness detection system that integrates machine learning and Flutter. I was responsible for backend integration, Firebase authentication, and AI model deployment. Let’s connect and build something amazing together!',
          style: GoogleFonts.tomorrow(
            fontSize: isMobile ? 14 : 16,
            height: 1.8,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 40),
        _buildSkillRow('UI/UX Design', 0.40, isMobile),
        const SizedBox(height: 20),
        _buildSkillRow('Project Management', 0.90, isMobile),
        const SizedBox(height: 20),
        _buildSkillRow('Backend Development', 0.75, isMobile),
        const SizedBox(height: 20),
        _buildSkillRow('Cybersecurity', 0.60, isMobile),
      ],
    );
  }

  Widget _buildEducationSection(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 50 : 80,
      ),
      color: Colors.grey[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EDUCATION',
            style: GoogleFonts.tomorrow(
              fontSize: isMobile ? 12 : 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 30),
          _buildEducationCard(
            degree:
                'Bachelor of Science Major in Information Technology with Specialization in Mobile and Web Application',
            institution: 'National University Philippines - Manila',
            period: '2022 - Present',
            description:
                'Relevant Coursework: Data Structures, Algorithms, Database Management, Web Development, Mobile App Development, Cybersecurity Fundamentals.',
            gpa: "Dean's Lister",
            isMobile: isMobile,
          ),
          const SizedBox(height: 20),
          _buildEducationCard(
            degree: 'Senior High School Diploma',
            institution: 'Krus Na Ligas High School - Quezon City',
            period: '2020 - 2022',
            description: 'Information and Communications Technology (ICT)',
            gpa: 'With Honors',
            isMobile: isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildTechnicalSkillsSection(bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TECHNICAL SKILLS',
            style: GoogleFonts.tomorrow(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final bool isMobile = constraints.maxWidth < 900;
              if (isMobile) {
                // 🟩 MOBILE VIEW (Stacked Vertically)
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSkillCategory(context, 'Frontend', [
                      'Flutter',
                      'React',
                      'Dart',
                      'HTML/CSS',
                      'JavaScript',
                    ]),
                    const SizedBox(height: 30),
                    _buildSkillCategory(context, 'Backend', [
                      'Node.js',
                      'Python',
                      'Firebase',
                      'MongoDB',
                      'REST API',
                    ]),
                    const SizedBox(height: 30),
                    _buildSkillCategory(context, 'Tools & Others', [
                      'Git',
                      'Figma',
                      'AWS',
                      'Firebase',
                      'Canva',
                    ]),
                  ],
                );
              } else {
                // 💻 DESKTOP VIEW (Side-by-Side)
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildSkillCategory(context, 'Frontend', [
                        'Flutter',
                        'React',
                        'Dart',
                        'HTML/CSS',
                        'JavaScript',
                      ]),
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      child: _buildSkillCategory(context, 'Backend', [
                        'Node.js',
                        'Python',
                        'Firebase',
                        'MongoDB',
                        'REST API',
                      ]),
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      child: _buildSkillCategory(context, 'Tools & Others', [
                        'Git',
                        'Figma',
                        'AWS',
                        'Firebase',
                        'Canva',
                      ]),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 50 : 80,
      ),
      color: Colors.grey[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FEATURED PROJECTS',
            style: GoogleFonts.tomorrow(
              fontSize: isMobile ? 12 : 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 40),
          isMobile
              ? Column(
                  children: [
                    _buildProjectCard(
                      title: 'Maduro Mobile & Web Application',
                      description:
                          'An AI-based mobile and web app that detects fruit ripeness using machine learning and image processing.',
                      position: 'Project Manager & Mobile Developer',
                      tags: [
                        'Flutter',
                        'Firebase',
                        'Python',
                        'TensorFlow',
                        'AI',
                        'ML',
                        'Image Processing',
                      ],
                      imageUrl: "assets/images/capstone1.jpg",
                    ),
                    const SizedBox(height: 30),
                    _buildProjectCard(
                      title: 'Ansanxcx Portfolio Website',
                      description:
                          'A personal portfolio website showcasing my projects, skills, and design sense. ',
                      position: 'Developer',
                      tags: [
                        'Flutter',
                        'Firebase',
                        'Web',
                        'UI/UX',
                        'Portfolio',
                        'Responsive',
                      ],
                      imageUrl: 'assets/images/website.png',
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _buildProjectCard(
                        title: 'Maduro Mobile & Web Application',
                        description:
                            'A mobile and web application that detects fruit ripeness - especially Banana - using MobileNetv2 with integration of Gemini AI. We develope this project using Flutter for cross-platform development and Firebase for backend services. The ML model is built with Python and TensorFlow, utilizing image processing techniques to ensure accurate ripeness detection. Gemini AI is integrated to provide recommendations based on the detected ripeness level.',
                        position: 'Project Manager & Mobile Developer',
                        tags: [
                          'Flutter',
                          'Firebase',
                          'Python',
                          'TensorFlow',
                          'AI',
                          'ML',
                          'Image Processing',
                        ],
                        imageUrl: "assets/images/capstone1.jpg",
                      ),
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      child: _buildProjectCard(
                        title: 'Ansanxcx Portfolio Website',
                        description:
                            'A personal portfolio website showcasing my projects, skills, and design sense. Using flutter for web to create a responsive and visually appealing layout, and Firebase for hosting and backend services. The website highlights my expertise in mobile and web application development, UI/UX design, and project management. It serves as a platform to connect with potential collaborators and employers.',
                        position: 'Developer',
                        tags: [
                          'Flutter',
                          'Firebase',
                          'Web',
                          'UI/UX',
                          'Portfolio',
                          'Responsive',
                        ],
                        imageUrl: 'assets/images/website.png',
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildOrganizationSection(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 50 : 80,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ORGANIZATIONS & INVOLVEMENT',
            style: GoogleFonts.tomorrow(
              fontSize: isMobile ? 12 : 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 30),
          _buildOrganizationItem(
            organization: '551st Media - National University',
            role: 'Videographer & Editor',
            period: '2022 - 2023',
            description:
                'Captured videos and created sports content for NU athletes and UAAP events.',
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // REUSABLE WIDGETS (updated for responsiveness)
  // -------------------------------------------------------------

  Widget _buildSkillRow(String skill, double progress, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skill,
              style: GoogleFonts.tomorrow(
                fontSize: isMobile ? 12 : 13,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                color: Colors.black,
              ),
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: GoogleFonts.tomorrow(
                fontSize: isMobile ? 11 : 12,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 3,
          width: double.infinity,
          color: Colors.black.withOpacity(0.1),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildEducationCard({
    required String degree,
    required String institution,
    required String period,
    required String description,
    required String gpa,
    required bool isMobile,
  }) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.school, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      degree,
                      style: GoogleFonts.tomorrow(
                        fontSize: isMobile ? 16 : 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      institution,
                      style: GoogleFonts.tomorrow(
                        fontSize: isMobile ? 13 : 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      description,
                      style: GoogleFonts.tomorrow(
                        fontSize: isMobile ? 13 : 14,
                        height: 1.6,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '$period • $gpa',
                      style: GoogleFonts.tomorrow(
                        fontSize: isMobile ? 12 : 13,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String category,
    List<String> skills,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: GoogleFonts.tomorrow(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: isMobile ? 6 : 10,
          runSpacing: isMobile ? 6 : 10,
          children: skills.map((skill) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 10 : 14,
                vertical: isMobile ? 6 : 8,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black.withOpacity(0.1)),
              ),
              child: Text(
                skill,
                style: GoogleFonts.tomorrow(
                  fontSize: isMobile ? 12 : 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildProjectCard({
    required String title,
    required String description,
    required String position,
    required List<String> tags,
    required String imageUrl,
  }) {
    bool isNetworkImage = imageUrl.startsWith('http');

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: isNetworkImage
                ? Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.tomorrow(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: GoogleFonts.tomorrow(
                    fontSize: 13,
                    height: 1.6,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  position,
                  style: GoogleFonts.tomorrow(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        tag,
                        style: GoogleFonts.tomorrow(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrganizationItem({
    required String organization,
    required String role,
    required String period,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.group,
                color: Colors.black.withOpacity(0.6),
                size: 24,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    organization,
                    style: GoogleFonts.tomorrow(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$role • $period',
                    style: GoogleFonts.tomorrow(
                      fontSize: 13,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: GoogleFonts.tomorrow(
                      fontSize: 13,
                      height: 1.6,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
