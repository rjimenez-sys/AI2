import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function(String?) onSaved;
  final String? Function(String?) validator;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.icon,
    required this.onSaved,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      // Aquí cumplimos el requisito de usar TextFormField
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
