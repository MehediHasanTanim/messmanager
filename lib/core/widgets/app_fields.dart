import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.label,
    this.controller,
    this.hintText,
    this.validator,
    this.onChanged,
    this.textInputAction,
    super.key,
  });

  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label, hintText: hintText),
      validator: validator,
      onChanged: onChanged,
      textInputAction: textInputAction,
    );
  }
}

class AppAmountInput extends StatelessWidget {
  const AppAmountInput({
    required this.label,
    this.controller,
    this.validator,
    this.onChanged,
    super.key,
  });

  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$label, Bangladeshi Taka amount',
      textField: true,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label, prefixText: '৳ '),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
        ],
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    required this.onChanged,
    this.hintText = 'খুঁজুন…',
    super.key,
  });

  final ValueChanged<String> onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Search',
      textField: true,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
