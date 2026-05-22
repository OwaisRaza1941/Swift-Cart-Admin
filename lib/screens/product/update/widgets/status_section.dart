import 'package:flutter/material.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product Status",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 5),

              Text(
                "Show this product in store",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),

          Switch(
            value: true,
            activeColor: Color(0xff4F46E5),
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
