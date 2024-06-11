import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final String hitn;
  final TextEditingController controller;

  final bool isObscureText;
  final Widget? suffixIcon;
  final double height;
  final double sizedBoxHeight;
  const AuthTextField(
      {super.key,
      required this.hitn,
      required this.controller,
      this.isObscureText = false,
      this.suffixIcon = null,
      this.height = 56,
      this.sizedBoxHeight = 8});

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
            focusNode: _focusNode,
            onTap: () {
              setState(() {
                _sizedBoxHeight = 0;
                dividerColor = Color(0xFF4E73DF);
              });
            },
            controller: widget.controller,
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









// Widget AuthTextField({
//   required String hitn,
//   bool isObscureText = false,
//   Icon? suffixIcon,
//   double height = 56,
//   double sizedBoxHeight = 8,
// }) =>
//     Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
//             color: Color(0xFFF7F7F7),
//           ),
//           height: height,
//           alignment: Alignment.bottomCenter,
//           child: TextFormField(
//             onTap: () {
//               sizedBoxHeight = 0;
//             },
//             onEditingComplete: () {
//               sizedBoxHeight = 8;
//             },
//             obscureText: isObscureText,
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.symmetric(horizontal: 16),
//               filled: true,
//               fillColor: Color(0xFFF7F7F7),
//               labelText: hitn,
//               floatingLabelStyle: TextStyle(fontSize: 14),
//               hintStyle: TextStyle(color: Color(0xFF868686)),
//               suffixIcon: isObscureText ? suffixIcon : null,
//               suffixIconColor: Color(0xFF868686),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: sizedBoxHeight,
//         ),
//         Divider(
//           height: 0,
//           color: Colors.black,
//           thickness: 1,
//         )
//       ],
//     );

// enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(4.0),
//                   topRight: Radius.circular(4.0),
//                 ),
//                 borderSide: BorderSide(
//                   color: Colors.transparent,
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(4.0),
//                   topRight: Radius.circular(4.0),
//                 ),
//                 borderSide: BorderSide(
//                   color: Colors.transparent,
//                 ),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20.0),
//                   topRight: Radius.circular(20.0),
//                 ),
//                 borderSide: BorderSide(
//                   color: Colors.transparent,
//                 ),
//               ),
//               focusedErrorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(4.0),
//                   topRight: Radius.circular(4.0),
//                 ),
//                 borderSide: BorderSide(
//                   color: Colors.transparent,
//                 ),
//               ),

//  Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
//             color: Color(0xFFF7F7F7),
//           ),
//           height: 56,
//           alignment: Alignment.bottomCenter,)
