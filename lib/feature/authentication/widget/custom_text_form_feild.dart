import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final IconData? prefixIcon;
  final Widget? suffix;
  final bool obscure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool showPasswordStrength;

  const CustomTextFormField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.suffix,
    this.obscure = false,
    this.controller,
    this.validator,
    this.onChanged,
    this.showPasswordStrength = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String _value = "";

  bool get _hasMinLength => _value.length >= 8;
  bool get _hasUpperCase => RegExp(r'[A-Z]').hasMatch(_value);
  bool get _hasLowerCase => RegExp(r'[a-z]').hasMatch(_value);
  bool get _hasNumber => RegExp(r'[0-9]').hasMatch(_value);
  bool get _hasSpecialChar =>
      RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(_value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: widget.controller,
            obscureText: widget.obscure,
            validator: widget.validator,
            onChanged: (value) {
              setState(() => _value = value);
              widget.onChanged?.call(value);
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
              hintText: widget.hint,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon)
                  : null,
              suffixIcon: widget.suffix,
            ),
          ),
          if (widget.showPasswordStrength && _value.isNotEmpty) ...[
            const SizedBox(height: 8),
            _buildCondition("At least 8 characters", _hasMinLength),
            _buildCondition("At least one uppercase (A-Z)", _hasUpperCase),
            _buildCondition("At least one lowercase (a-z)", _hasLowerCase),
            _buildCondition("At least one number (0-9)", _hasNumber),
            _buildCondition(
              "At least one special character (!@#\$)",
              _hasSpecialChar,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCondition(String text, bool isValid) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.cancel,
            color: isValid ? Colors.green : Colors.red,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: isValid ? Colors.green : Colors.red,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
