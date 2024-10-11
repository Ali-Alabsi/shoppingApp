import 'package:flutter/material.dart';
import '../theming/colors.dart';
import '../theming/text_styles.dart';


class MainButton extends StatelessWidget {
  final void Function()? onPressed;
  final String name;
  final EdgeInsetsGeometry? margin;
  const MainButton({
    super.key,
    this.onPressed,
    required this.name,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsetsDirectional.symmetric(horizontal: 15),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: MaterialButton(
        color: ProjectColors.mainColor,
        height: 52,
        minWidth: double.infinity,
        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyles.font16WhiteColorW600,
        ),
      ),
    );
  }
}
