import 'package:flutter/material.dart';

class FormController {
  final key = GlobalKey<FormState>();
  final controller = TextEditingController();

  String? validate(String? value) {
    if (value != null && value.isEmpty) {
      return 'O nome do Pokémon deve ser preenchido';
    }
    return null;
  }

  bool isValid() {
    return key.currentState!.validate();
  }

  void reset() {
    key.currentState!.reset();
    controller.text = '';
  }
}
