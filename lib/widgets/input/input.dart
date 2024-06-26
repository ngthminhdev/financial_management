import 'package:financial_management/core/color.dart';
import 'package:financial_management/widgets/input/input_constant.dart';
import 'package:flutter/material.dart';
// import 'package:material_symbols_icons/material_symbols_icons.dart';

class FMInput extends StatefulWidget {
  final String label;
  final FMInputType type;
  final IconData? icon;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final double width;
  final double height;
  final bool isObscured;

  const FMInput({
    Key? key,
    required this.label,
    this.type = FMInputType.normal,
    this.width = double.infinity,
    this.height = 50,
    this.isObscured = false,
    this.icon,
    this.onChange,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  State<FMInput> createState() => _FMInputState();
}

class _FMInputState extends State<FMInput> {
  bool isError = false;
  String errorValidate = '';
  Color _getBorderColor(FMInputType type) {
    switch (type) {
      case FMInputType.normal:
        return appColors.purple;
      case FMInputType.secondary:
        return appColors.grey;
    }
  }

  bool _validator(String? text, Function(String)? internalValidator) {
    if (text == null || text.isEmpty) {
      return true;
    } 
    if (widget.validator == null) {
      return true;
    }
    if (widget.validator != null) {
      String? error = widget.validator!(text);
      if (error != null) {
        setState(() {
          isError = true;
          errorValidate = error;
        });
        return false;
      }
    }
    setState(() {
      errorValidate = '';
      isError = false;
    });
    return true;
  }

  Color _inputBorderColor() {
    return isError ? Colors.red : _getBorderColor(widget.type);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: _inputBorderColor(),
                  width: 1,
                )),
            child: TextFormField(
              controller: widget.controller,
              textAlign: TextAlign.start,
              obscureText: widget.isObscured,
              decoration: InputDecoration(
                // suffixIcon: widget.isObscured ? Icon(Symbols.remove_red_eye) : null,
                labelText: widget.label,
                alignLabelWithHint: true,
                isDense: true,
                contentPadding: const EdgeInsets.only(bottom: 18),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                icon: widget.icon != null
                    ? Icon(widget.icon, size: 25, color: _inputBorderColor())
                    : null,
                enabledBorder:
                    const UnderlineInputBorder(borderSide: BorderSide.none),
                focusedBorder:
                    const UnderlineInputBorder(borderSide: BorderSide.none),
                errorBorder:
                    const UnderlineInputBorder(borderSide: BorderSide.none),
                focusedErrorBorder:
                    const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
              onChanged: (value) {
                _validator(value, widget.onChange);
              },
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          isError
              ? Text(errorValidate,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.bold))
              : const Text('Error Text Padding',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.transparent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
