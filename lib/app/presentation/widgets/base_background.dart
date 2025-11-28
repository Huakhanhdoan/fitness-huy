import 'package:flutter/material.dart';

class BaseBackground extends StatelessWidget {
  final String title;

  const BaseBackground({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        // gradient
        gradient: LinearGradient(
          colors: [
            Color(0xFF81C784), // Brighter green
            Color(0xFF4CAF50), // Rich green
            Color(0xFF388E3C), // Darker green
          ],
          stops: [0.0, 0.5, 1.0],
          begin: Alignment.topRight,
          end: Alignment.centerLeft,
        ),
        // image: DecorationImage(
        //   image: Assets.images.backgroundAuth.image().image,
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Space for the top
          Padding(
            padding: const EdgeInsets.only(top: 64, left: 24),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
