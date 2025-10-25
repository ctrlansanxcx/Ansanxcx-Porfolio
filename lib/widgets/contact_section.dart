import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final _subjectController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    _subjectController.dispose();
    super.dispose();
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      final firstName = _firstNameController.text.trim();
      final lastName = _lastNameController.text.trim();
      final email = _emailController.text.trim();
      final message = _messageController.text.trim();
      final subject = _subjectController.text.trim();

      // 🔹 Your deployed Firebase Function endpoint
      final Uri url = Uri.parse(
        'https://sendcontactemail-2f7zzxjcvq-uc.a.run.app',
      );

      try {
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'firstName': firstName,
            'lastName': lastName,
            'email': email,
            'subject': subject,
            'message': message,
          }),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Message sent successfully!'),
              backgroundColor: Colors.white,
              behavior: SnackBarBehavior.floating,
            ),
          );

          // Clear form fields
          _firstNameController.clear();
          _lastNameController.clear();
          _emailController.clear();
          _subjectController.clear();
          _messageController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '❌ Failed to send message. (${response.statusCode})',
              ),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('⚠️ Error sending message: $e'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 120),
      decoration: BoxDecoration(
        color: Colors.black,
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?w=1920',
          ),
          fit: BoxFit.cover,
          opacity: 0.15,
        ),
      ),
      child: Column(
        children: [
          _buildSectionHeader(),
          const SizedBox(height: 80),
          LayoutBuilder(
            builder: (context, constraints) {
              // make responsive for web & mobile
              bool isMobile = constraints.maxWidth < 900;
              return isMobile
                  ? Column(
                      children: [
                        _buildContactInfo(),
                        const SizedBox(height: 50),
                        _buildContactForm(),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 1, child: _buildContactInfo()),
                        const SizedBox(width: 100),
                        Expanded(flex: 1, child: _buildContactForm()),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      children: [
        Text(
          'CONTACT',
          style: GoogleFonts.tomorrow(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Let's Create Something\nAmazing Together",
          textAlign: TextAlign.center,
          style: GoogleFonts.tomorrow(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            height: 1.2,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get in Touch',
          style: GoogleFonts.tomorrow(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Feel free to reach out for collaborations or just a friendly hello!',
          style: GoogleFonts.tomorrow(
            fontSize: 15,
            height: 1.6,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 60),
        _buildContactItem(
          Icons.mail_outline,
          'Email',
          'ballesteros.johntristan@gmail.com',
        ),
        const SizedBox(height: 35),
        _buildContactItem(
          Icons.mail_outline,
          'Email',
          'ballesteros.johntristan.valdez@gmail.com',
        ),
        const SizedBox(height: 35),
        _buildContactItem(Icons.phone_outlined, 'Phone', '0935-960-8357'),
        const SizedBox(height: 35),
        _buildContactItem(Icons.phone_outlined, 'Phone', '0992-844-3808'),
        const SizedBox(height: 35),
        _buildContactItem(
          Icons.location_on_outlined,
          'Location',
          'Kaingin 1, Block 5, Pansol\nQuezon City, 1800',
        ),
        const SizedBox(height: 60),
        Text(
          'FOLLOW ME',
          style: GoogleFonts.tomorrow(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 15,
          runSpacing: 10,
          children: [
            _buildSocialIcon(
              FontAwesomeIcons.linkedin,
              'https://www.linkedin.com/in/ballesterosjt/',
            ),
            _buildSocialIcon(
              FontAwesomeIcons.github,
              'https://github.com/ansanxcx',
            ),
            _buildSocialIcon(
              FontAwesomeIcons.instagram,
              'https://www.instagram.com/ansanxcx/',
            ),
            _buildSocialIcon(
              FontAwesomeIcons.medium,
              'https://medium.com/@ansonplatt',
            ),
            _buildSocialIcon(
              FontAwesomeIcons.facebook,
              'https://facebook.com/ansanxcx',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.tomorrow(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: GoogleFonts.tomorrow(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          debugPrint('Could not launch $url');
        }
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        ),
        child: Center(child: FaIcon(icon, size: 20, color: Colors.white)),
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Send Message',
              style: GoogleFonts.tomorrow(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: _firstNameController,
                    label: 'First Name',
                    hint: 'John',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildTextField(
                    controller: _lastNameController,
                    label: 'Last Name',
                    hint: 'Doe',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            _buildTextField(
              controller: _emailController,
              label: 'Email Address',
              hint: 'john.doe@example.com',
            ),
            const SizedBox(height: 25),
            _buildTextField(
              controller: _subjectController,
              label: 'Subject',
              hint: 'Project Inquiry',
            ),
            const SizedBox(height: 25),
            _buildTextField(
              controller: _messageController,
              label: 'Message',
              hint: 'Tell me about your project...',
              maxLines: 5,
            ),
            const SizedBox(height: 35),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.tomorrow(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: GoogleFonts.tomorrow(color: Colors.black, fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.tomorrow(
              color: Colors.black.withOpacity(0.3),
              fontSize: 14,
            ),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: maxLines > 1 ? 18 : 16,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            if (label == 'Email Address' && !value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return InkWell(
      onTap: _handleSubmit,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SEND MESSAGE',
              style: GoogleFonts.tomorrow(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}
