import 'package:financial_management/widgets/input/input_constant.dart';
import 'package:flutter/material.dart';

class FMInput extends StatefulWidget {
  final String text;
  final FMInputType type;
  final IconData? icon;
  final Function(String)? onChange;

  const FMInput({
    Key? key,
    required this.text,
    this.type = FMInputType.normal,
    this.icon,
    this.onChange,
  }) : super(key: key);

  @override
  State<FMInput> createState() => _FMInputState();
}

class _FMInputState extends State<FMInput> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
