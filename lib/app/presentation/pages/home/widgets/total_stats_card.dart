import 'package:flutter/material.dart';

class TotalStatsCard extends StatelessWidget {
  final IconData icon;
  final String nameCard;
  final String unit;
  final double value;
  final VoidCallback? onTap;

  const TotalStatsCard({
    super.key,
    required this.icon,
    required this.nameCard,
    required this.unit,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.pink.withValues(alpha: 0.8),
                Colors.pink.withValues(alpha: 0.2),
              ],
              stops: const [0.0, 0.7],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(icon, size: 55, color: Colors.white),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nameCard,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value.toStringAsFixed(2),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    unit,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.navigate_next_outlined,
                size: 45,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
