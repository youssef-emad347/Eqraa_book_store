import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpCustomWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const OtpCustomWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<OtpCustomWidget> createState() => _OtpCustomWidgetState();
}

class _OtpCustomWidgetState extends State<OtpCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        controller: widget.controller,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: -15), // اضبط الرقم على حسب
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: widget.onChanged,
      ),
    );
  }
}
