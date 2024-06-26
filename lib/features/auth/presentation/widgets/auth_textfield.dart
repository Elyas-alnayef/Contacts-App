import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final String hitn;
  final bool isObscureText;
  final Widget? suffixIcon;
  final double height;
  final double sizedBoxHeight;
  final TextEditingController controller;
  final void Function() func;
  final String? Function(String value) validate;

  const AuthTextField({
    super.key,
    required this.hitn,
    this.isObscureText = false,
    this.suffixIcon = null,
    this.height = 56,
    this.sizedBoxHeight = 8,
    required this.func,
    required this.validate,
    required this.controller,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  Color dividerColor = Colors.black;
  final FocusNode _focusNode = FocusNode();
  late double _sizedBoxHeight;
  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      setState(() {
        _sizedBoxHeight = 8;
        dividerColor = Colors.black;
      });
    }
  }

  @override
  void initState() {
    _focusNode.addListener(_onFocusChange);
    _sizedBoxHeight = widget.sizedBoxHeight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
            color: Color(0xFFF7F7F7),
          ),
          height: widget.height,
          alignment: Alignment.bottomCenter,
          child: TextFormField(
            controller: widget.controller,
            validator: (value) {
              return widget.validate(value!);
            },
            onTapOutside: (newValue) {
              widget.func();
            },
            focusNode: _focusNode,
            onTap: () {
              setState(() {
                _sizedBoxHeight = 0;
                dividerColor = Color(0xFF4E73DF);
              });
            },
            obscureText: widget.isObscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              filled: true,
              fillColor: Color(0xFFF7F7F7),
              labelText: widget.hitn,
              floatingLabelStyle: TextStyle(fontSize: 14),
              hintStyle: TextStyle(color: Color(0xFF868686)),
              suffixIcon: widget.suffixIcon,
              suffixIconColor: Color(0xFF868686),
            ),
          ),
        ),
        SizedBox(
          height: _sizedBoxHeight,
        ),
        Divider(
          height: 0,
          color: dividerColor,
          thickness: 1,
        )
      ],
    );
  }
}
