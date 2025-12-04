import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color? buttonBg;
  final Color? inputBg;

  const CustomColors({this.buttonBg, this.inputBg});

  @override
  CustomColors copyWith({Color? buttonBg, Color? inputBg}) => CustomColors(
      buttonBg: buttonBg ?? this.buttonBg, inputBg: inputBg ?? this.inputBg);

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      buttonBg: Color.lerp(buttonBg, other.buttonBg, t),
      inputBg: Color.lerp(inputBg, other.inputBg, t),
    );
  }
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    extensions: <ThemeExtension<dynamic>>[
      const CustomColors(
        buttonBg: Color(0xFFF0F0F0),
        inputBg: Color(0xFFF0F0F0),
      ),
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    extensions: <ThemeExtension<dynamic>>[
      const CustomColors(
        buttonBg: Color(0xFF2A2A2A),
        inputBg: Color(0xFF1F1F1F),
      ),
    ],
  );
}
