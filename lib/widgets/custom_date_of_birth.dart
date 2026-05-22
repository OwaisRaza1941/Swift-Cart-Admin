import 'package:flutter/material.dart';

TextEditingController dobController = TextEditingController();

class CustomDateOfBirth extends StatelessWidget {
  const CustomDateOfBirth({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: dobController,
        readOnly: true,
        decoration: InputDecoration(
          labelText: "Date of Birth",
          suffixIcon: Icon(Icons.calendar_today),
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime(2010),
            firstDate: DateTime(1950),
            lastDate: DateTime.now(),
          );

          if (pickedDate != null) {
            dobController.text =
                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          }
        },
      ),
    );
  }
}
