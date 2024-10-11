
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../theming/colors.dart';
import '../theming/text_styles.dart';


class AppTextFormFiled extends StatelessWidget {
  const AppTextFormFiled(
      {super.key,
      this.contentPadding,
      required this.hintText,
      this.hintStyle,
      this.enabledBorder,
      this.focusedBorder,
      this.fillColor,
      this.suffixIcon,
      this.controller,
        this.validator,
        this.maxLines,
        this.minLines, this.keyboardType,
        this.prefixIcon,
        this.obscureText =false,
        this.spaceActive =false, this.errorBorder, this.focusedErrorBorder,

      });
  final EdgeInsetsGeometry? contentPadding;
  final String hintText;
  final TextStyle? hintStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Color? fillColor;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines ;
  final int? minLines ;
  final Widget? prefixIcon;
  final spaceActive;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: !spaceActive ? [
         FilteringTextInputFormatter.allow(RegExp(r'[^\s]')),
      ] :[],
      keyboardType:keyboardType ?? TextInputType.text,
      validator: validator,
      controller: controller,
      maxLines: maxLines??1,
      minLines: minLines?? 1 ,
      decoration: InputDecoration(
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          hintText: hintText,
          hintStyle: hintStyle ?? TextStyles.font14grayColorW400,
          prefixIcon:prefixIcon ,
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderSide:  BorderSide(
                    color: ProjectColors.mainColor,
                    width: 1
                  ),
                  borderRadius: BorderRadius.circular(16)),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderSide:  BorderSide(
                    color: ProjectColors.mainColor,
                      width: 3
                  ),
                  borderRadius: BorderRadius.circular(16)),
          focusedErrorBorder: focusedBorder ??
              OutlineInputBorder(
                  borderSide:  BorderSide(
                      color: ProjectColors.mainColor,
                      width: 3
                  ),
                  borderRadius: BorderRadius.circular(16)),
          errorBorder: focusedBorder ??
              OutlineInputBorder(
                  borderSide:  BorderSide(
                      color: ProjectColors.redColor,
                      width: 2
                  ),
                  borderRadius: BorderRadius.circular(16)),
          fillColor: fillColor ?? ProjectColors.mainColor.withOpacity(0.2),
          filled: true,
          suffixIcon: suffixIcon),
      obscureText: obscureText,
    );
  }
}

// class FormFieldToInsertDate extends StatelessWidget {
//   final String hintText;
//   final void Function(DateTime)? onDateSelected;
//   final DateTime? initialValue;
//
//   const FormFieldToInsertDate({
//     super.key,
//     required this.hintText,
//     this.onDateSelected, this.initialValue,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return DateTimeFormField(
//       decoration: InputDecoration(
//         prefixIcon:   Icon(Icons.date_range , color: ProjectColors.blueColor,),
//           contentPadding:
//           const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           hintText: hintText,
//           hintStyle: TextStyles.font14grayColorW400,
//           enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: ProjectColors.grayColors,
//               ),
//               borderRadius: BorderRadius.circular(16)),
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: ProjectColors.mainColor,
//               ),
//               borderRadius: BorderRadius.circular(16)),
//           fillColor: ProjectColors.mainColor.withOpacity(0.2),
//           filled: true,
//           // suffixIcon: Icon(Icons.date_range)
//       )
//       ,
//       firstDate: DateTime.now().add(const Duration(days: 0)),
//       lastDate: DateTime.now().add(const Duration(days: 90)),
//       initialValue: initialValue,
//       onDateSelected: onDateSelected,
//       dateFormat: DateFormat('yyyy-MM-dd'),
//
//
//     );
//   }
// }