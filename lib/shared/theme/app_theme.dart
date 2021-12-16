import 'package:ta_caro/shared/theme/app_colors.dart';
import 'package:ta_caro/shared/theme/app_text_styles.dart';

class AppTheme {
  //Singleton
  static final instance = AppTheme();

  final _colors = AppColors();
  static IAppColors get colors => instance._colors;

  final _textStyles = AppTextStyle();
  static IAppTextStyle get textStyles => instance._textStyles;
}
