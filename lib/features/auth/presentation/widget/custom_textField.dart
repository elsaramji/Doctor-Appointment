import 'package:flutter/material.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool obscure;
  final String? Function(String?)? validator;
  final Widget? prefixWidget;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.obscure = false,
    this.validator,
    this.prefixWidget,
    required TextInputType keyboardType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final active = focusNode.hasFocus || widget.controller.text.isNotEmpty;

    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      focusNode: focusNode,
      obscureText: widget.obscure,
      decoration: InputDecoration(
        prefixIcon: widget.prefixWidget != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: widget.prefixWidget,
              )
            : null,
        hintText: widget.hint,
        filled: true,
        fillColor: AppColors.primary50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.primaryDefault, width: 2),
        ),
      ),
    );
  }
}
