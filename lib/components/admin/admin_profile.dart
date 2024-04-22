import 'package:ca_junction/theme/daytheme.dart';
import 'package:flutter/material.dart';

class AdminProfileScreen extends StatelessWidget {
  final String userName = 'CA ALok Mani';
  final String designation = '# Alok 192';
  final bool hasNotification = true;

  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/background_img.png', // Path to your background image
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text("Admin Profile"),
            )
          ],
        ),
      ),
    );
  }
}
