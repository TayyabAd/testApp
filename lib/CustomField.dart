// import 'package:dar_ren/Constants/AppAssets.dart';
import 'package:flutter/material.dart';
// import '../Constants/Imports.dart';

class newTextField extends StatefulWidget {
  const newTextField({
    Key? key,
    required this.controller,
    this.horizontalPadding = 0,
    this.labelFontSize = 16,
    this.prefixIcon = const SizedBox(width: 0, height: 0),
    this.labelText = "",
    this.suffixIcon = const SizedBox(width: 0, height: 0),
    this.isDivider = true,
    this.labelFontColor = const Color(0xff369B80),
    this.width = 0,
    this.pass = false,
  }) : super(key: key);

  final Widget prefixIcon;
  final Widget suffixIcon;
  final String labelText;
  final double width;
  final bool pass;
  final bool isDivider;
  final Color labelFontColor;
  final double labelFontSize;
  final double horizontalPadding;
  final TextEditingController controller;

  @override
  State<newTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<newTextField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.08,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        controller: widget.controller,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        obscureText: widget.pass ? hidePassword : false,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            prefixText:
                widget.prefixIcon.toString() == "SizedBox.shrink" ? "    " : "",
            suffixText:
                widget.suffixIcon.toString() == "SizedBox.shrink" ? "    " : "",
            prefixIcon: widget.prefixIcon.toString() == "SizedBox.shrink"
                ? null
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: width * 0.04,
                      ),
                      widget.prefixIcon,
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Visibility(
                        visible: widget.isDivider,
                        child: SizedBox(
                            // height: width * 0.08,
                            child: const VerticalDivider(
                          color: Colors.grey,
                          thickness: 1.5,
                        )),
                      ),
                    ],
                  ),
            labelText: widget.labelText,
            labelStyle: TextStyle(
              fontSize: widget.labelFontSize,
              color: Colors.grey,
            ),
            suffixIcon: widget.pass
                ? IconButton(
                    color: Colors.black,
                    icon: Icon(
                      hidePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  )
                : widget.suffixIcon.toString() == "SizedBox.shrink"
                    ? null
                    : widget.suffixIcon),
      ),
    );
  }
}

// Widget searchField(double height, double width, Color color, bool showBorder,
//     VoidCallback onSubmit) {
//   return Container(
//     width: width,
//     height: height * 0.08,
//     decoration: BoxDecoration(
//         color: color,
//         border: showBorder ? Border.all(width: 0, color: Colors.grey) : null,
//         borderRadius: BorderRadius.circular(10)),
//     child: Row(children: [
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Container(
//           alignment: Alignment.center,
//           width: width * 0.7,
//           height: height * 0.08,
//           child: TextField(
//             onEditingComplete: onSubmit,
//             decoration: InputDecoration(
//                 // contentPadding: EdgeInsets.all(0),
//                 // isDense: true,
//                 isCollapsed: true,
//                 border: InputBorder.none,
//                 hintText: "Search"),
//           ),
//         ),
//       ),
//       Padding(
//         padding: EdgeInsets.symmetric(vertical: height * 0.02),
//         child: Container(
//           width: 1,
//           color: Colors.grey.withOpacity(0.8),
//         ),
//       ),
//       Expanded(
//         child: Container(
//             // color: Colors.yellow,
//             child: Image.asset(
//           AppAssets.searchIcon,
//           color: Colors.black,
//           scale: 3.5,
//         )),
//       )
//     ]),
//   );
// }
