import 'package:flutter/material.dart';
textFiledWidget({
  required TextEditingController txtController,
  bool haveIcon = false,
  String? Function(String?)? validator,
  Widget? iconData,
  Function()? onTapIcon,
  String? hintText,
  bool? obscureText = false,
  Function()? onTap,
  Function(String?)? onChanged,
  TextInputType? keyboardType = TextInputType.text
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
            controller: txtController,
            obscureText: obscureText!,
            obscuringCharacter: "*",
            keyboardType: keyboardType,
            onTap: onTap,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 13),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      width: 1, color: Colors.red)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      width: 1, color: Colors.blueAccent)
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      width: 1, color: Colors.black)
              ),
              filled: true,
              fillColor: Color(0xFFFAFAFA),
              contentPadding:
              EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              isDense: true,
              labelText: hintText,
              labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              suffixIconConstraints: const BoxConstraints(
                  minHeight: 20,
                  minWidth: 20
              ),
              suffixIcon: haveIcon
                  ? GestureDetector(onTap: onTapIcon!, child: Container(
                  width: 50,
                  child: iconData!))
                  : null,
            ),
            onChanged: onChanged,
            validator: validator)
      ],
    ),
  );
}
