import 'package:flutter/material.dart';
import 'package:ta_caro/shared/theme/app_theme.dart';

enum ButtonType { fill, outline, none }

class CustomButton extends StatelessWidget {
  final String label;
  final ButtonType type;
  final Function() onTap;

  const CustomButton({
    required this.label,
    this.type = ButtonType.fill,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  TextStyle get textStyle {
    switch (type) {
      case ButtonType.fill:
        return AppTheme.textStyles.buttonBackgroundColor;
        break;
      case ButtonType.outline:
        return AppTheme.textStyles.buttonBoldTextColor;
        break;
      case ButtonType.none:
        return AppTheme.textStyles.buttonTextColor;
        break;
      default:
        throw 'INVALID BUTTON TYPE';
    }
  }

  BoxDecoration get boxDecoration {
    switch (type) {
      case ButtonType.fill:
        return BoxDecoration(
          color: AppTheme.colors.primary,
          borderRadius: BorderRadius.circular(10),
        );
        break;
      case ButtonType.outline:
        return BoxDecoration(
          color: AppTheme.colors.background,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(color: AppTheme.colors.border, width: 2),
          ),
        );
        break;
      case ButtonType.none:
        return BoxDecoration(
          color: Colors.transparent,
        );
        break;
      default:
        throw 'INVALID BUTTON TYPE';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: double.maxFinite,
        decoration: boxDecoration,
        child: Center(
          child: Text(
            label,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
