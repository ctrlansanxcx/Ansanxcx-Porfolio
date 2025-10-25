import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNavigationBar extends StatelessWidget {
  final Function(String) onNavigate;

  const CustomNavigationBar({Key? key, required this.onNavigate})
    : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;

    double navWidth = isMobile ? screenWidth - 40 : 1400;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: navWidth,
        height: 70,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: isMobile ? _buildMobileNav(context) : _buildDesktopNav(),
      ),
    );
  }

  Widget _buildDesktopNav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        Row(
          children: [
            _buildNavItem('HOME', onNavigate),
            const SizedBox(width: 50),
            _buildNavItem('EXPERIENCE', onNavigate),
            const SizedBox(width: 50),
            _buildNavItem('CERTIFICATION', onNavigate),
            const SizedBox(width: 50),
            _buildNavItem('ABOUT ME', onNavigate),
            const SizedBox(width: 50),
            _buildContactButton(onNavigate),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (_) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildMobileNavItem(context, 'HOME'),
                    _buildMobileNavItem(context, 'EXPERIENCE'),
                    _buildMobileNavItem(context, 'CERTIFICATION'),
                    _buildMobileNavItem(context, 'ABOUT ME'),
                    _buildMobileNavItem(context, 'CONTACT'),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMobileNavItem(BuildContext context, String title) {
    return ListTile(
      title: Center(
        child: Text(
          title,
          style: GoogleFonts.tomorrow(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pop(); // Close the modal
        onNavigate(title); // Trigger the navigation
      },
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Image.asset('images/logo.png', height: 30),
        const SizedBox(width: 12),
        Text(
          'ANSANXCX',
          style: GoogleFonts.tomorrow(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(String title, Function(String) onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => onTap(title),
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          title,
          style: GoogleFonts.tomorrow(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildContactButton(Function(String) onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => onTap('CONTACT'),
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 11),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            'CONTACT',
            style: GoogleFonts.tomorrow(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
