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
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFEEEEEE),
      foregroundColor: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Colors.black),
    ),
    extensions: <ThemeExtension<dynamic>>[
      const CustomColors(
        buttonBg: Color(0xFFF0F0F0),
        inputBg: Color(0xFFF0F0F0),
      ),
    ],
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.blueGrey,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
    ),
    extensions: <ThemeExtension<dynamic>>[
      const CustomColors(
        buttonBg: Color(0xFF2A2A2A),
        inputBg: Color(0xFF1F1F1F),
      ),
    ],
    useMaterial3: true,
  );
}
