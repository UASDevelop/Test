import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopicChip extends StatelessWidget {
  final String topic;
  final bool isSelected;
  final VoidCallback onTap;

  const TopicChip({
    required this.topic,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade400 : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black87),
        ),
        child: Text(
          topic,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
