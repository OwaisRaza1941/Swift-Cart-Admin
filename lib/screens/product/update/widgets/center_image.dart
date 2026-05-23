import 'package:flutter/material.dart';

class CenterImage extends StatelessWidget {
  final String image;
  const CenterImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(image, fit: BoxFit.contain),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: Color(0xff4F46E5),
                borderRadius: BorderRadius.circular(14),
              ),

              child: Icon(Icons.camera_alt_outlined, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
