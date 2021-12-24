import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KitaroTextField extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const KitaroTextField({
    Key? key,
    required this.labelText,
    required this.onChanged,
    this.errorText,
    this.onSubmitted,
    this.focusNode,
  }) : super(key: key);

  // ------------------------------- FIELDS -------------------------------
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? labelText;
  final String? errorText;
  final FocusNode? focusNode;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    final hasError = errorText?.isNotEmpty == true;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 14.0,
            color: hasError ? Colors.red.shade900 : const Color(0xff969FAA),
            fontWeight: FontWeight.normal
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff969FAA),
              width: 1.0,
            ),
          ),
          errorText: errorText,
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        style: const TextStyle(
          color: Color(0xff343F4B),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),
    );
  }
}

class KitaroPasswordTextField extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const KitaroPasswordTextField({
    Key? key,
    required this.labelText,
    required this.onChanged,
    this.errorText,
    this.onSubmitted,
    this.focusNode,
  }) : super(key: key);

  // ------------------------------- FIELDS -------------------------------
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? labelText;
  final String? errorText;
  final FocusNode? focusNode;

  // ------------------------------- METHODS ------------------------------
  @override
  State<KitaroPasswordTextField> createState() => _KitaroPasswordTextFieldState();
}

class _KitaroPasswordTextFieldState extends State<KitaroPasswordTextField> {
  // ------------------------------- FIELDS -------------------------------
  bool _obscureText = true;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText?.isNotEmpty == true;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
            fontSize: 14.0,
            color: hasError ? Colors.red.shade900 : const Color(0xff969FAA),
            fontWeight: FontWeight.normal
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff969FAA),
              width: 1.0,
            ),
          ),
          suffixIcon: IconButton(
            color: hasError
                ? Colors.red.shade900
                : const Color(0xff969FAA),
            icon: Icon(
              _obscureText
                  ? CupertinoIcons.eye_fill
                  : CupertinoIcons.eye_slash_fill,
            ),
            onPressed: () => setState(() => _obscureText = !_obscureText),
          ),
          errorText: widget.errorText,
        ),
        keyboardType: _obscureText ? TextInputType.text : TextInputType.visiblePassword,
        textInputAction: TextInputAction.next,
        style: const TextStyle(
          color: Color(0xff343F4B),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}

class KitaroTextBox extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const KitaroTextBox({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    required this.errorText,
    this.onSubmitted,
    this.focusNode,
  }) : super(key: key);

  // ------------------------------- FIELDS -------------------------------
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? labelText;
  final String? errorText;
  final FocusNode? focusNode;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    final hasError = errorText?.isNotEmpty == true;

    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        isDense: true,
        hintText: labelText,
        hintStyle: const TextStyle(
          color: Color(0x424D627B),
          fontSize: 14.0,
        ),
        labelStyle: TextStyle(
          fontSize: 14.0,
          color: hasError ? Colors.red.shade900 : const Color(0xff969FAA),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Color(0xff969FAA),
            width: 1.0,
          ),
        ),
        errorText: errorText,
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      style: const TextStyle(
        color: Color(0xff343F4B),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}


