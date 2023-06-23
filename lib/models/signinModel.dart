import 'package:flutter/material.dart';

class SignInModel {
  final unfocusNode = FocusNode();
  void initState(BuildContext context) {}
  void dispose() {
    unfocusNode.dispose();
  }
}
