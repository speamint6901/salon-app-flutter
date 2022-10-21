import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    super.key,
    required this.keybordType,
    required this.onChanged,
    required this.roundedController,
    required this.labelText,
    required this.color,
    required this.borderColor,
    required this.shadowColor,
    required this.obscureText,
  });
  final TextInputType keybordType;
  final void Function(String)? onChanged;
  final TextEditingController? roundedController;
  final String labelText;
  final Color color;
  final Color borderColor;
  final Color shadowColor;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30.0),
        width: width * 0.9,
        child: TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.green[100]!,
              ),
            ),
            // border: OutlineInputBorder(),
            labelText: labelText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.green[100]!,
              ),
            ),
          ),
          keyboardType: keybordType,
          onChanged: onChanged,
          controller: roundedController,
        ),
      ),
    );
    // );
  }
}
