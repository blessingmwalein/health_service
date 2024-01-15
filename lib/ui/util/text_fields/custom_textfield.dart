import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/ui/util/icon.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget(
      {Key? key,
      required this.label,
      required this.hint,
      required this.isPassword,
      required this.controller,
      this.textInputType,
      this.validator,
      this.onChanged})
      : super(key: key);

  final String label;
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  @override
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool _obscureText = true;

  String? errorText;

  @override
  void initState() {
    super.initState();
    // Listen to changes in the text field's value
    widget.controller.addListener(updateErrorText);
  }

  @override
  void dispose() {
    // Don't forget to remove the listener when the widget is disposed
    widget.controller.removeListener(updateErrorText);
    super.dispose();
  }

  void updateErrorText() {
    // Update the error text based on the validator
    final error = widget.validator?.call(widget.controller.text);
    if (error != errorText) {
      setState(() {
        errorText = error;
      });
    }

    // Trigger the onChanged callback
    if (widget.onChanged != null) {
      widget.onChanged!(widget.controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (_) {
        // Listen for changes in the text field's value
        updateErrorText();
      },
      controller: widget.controller,
      obscureText: widget.isPassword && _obscureText,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        focusColor: primaryPurple,
        labelStyle: const TextStyle(
          color: primaryPurple,
        ),
        hintStyle: TextStyle(
          color: primaryPurple.withOpacity(0.4),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: primaryPurple,
            width: 2.0,
          ),
        ),
        suffixIcon: widget.isPassword
            ? Container(
                padding: const EdgeInsets.all(6.0),
                width: 10,
                height: 10,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: myIcon(
                      path: _obscureText
                          ? "assets/icons/eye-outlined.svg"
                          : "assets/icons/eye-off-outlined.svg",
                      width: 10,
                      height: 10,
                      iconColor: primaryBlack.withOpacity(0.4)),
                ),
              )
            : null,
      ),
    );
  }
}
