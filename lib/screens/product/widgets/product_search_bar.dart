import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search products...",
              prefixIcon: Icon(Icons.search),

              filled: true,
              fillColor: Colors.white,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Color(0xff4F46E5)),
              ),
            ),
          ),
        ),

        SizedBox(width: 15),

        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color(0xff4F46E5),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(Icons.filter_list, color: Colors.white),
        ),
      ],
    );
  }
}
