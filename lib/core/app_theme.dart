import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

final secondaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: AppColors.secondary500,
  foregroundColor: AppColors.white,
  padding: const EdgeInsets.symmetric(vertical: 14),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
);

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    // =========================
    // 🎨 Color Scheme
    // =========================
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary500,
      secondary: AppColors.secondary500,
      surface: AppColors.white,
      error: Colors.red,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.textPrimary,
    ),

    // =========================
    // 🔤 Text Theme
    // =========================
    /// 앱 전반의 기본 텍스트 역할 정의
    textTheme: const TextTheme(
      /// AppBar 타이틀, 페이지 메인 제목
      titleLarge: AppTextStyles.s20w600,

      /// 카드 제목, 기기명, 가격 강조
      titleMedium: AppTextStyles.s18w600,

      /// 카드 제목, 기기명, 가격 일반
      titleSmall: AppTextStyles.s18w500,

      /// 기본 본문
      bodyMedium: AppTextStyles.s16w400,

      /// 보조 설명
      bodySmall: AppTextStyles.s12w400,

      /// 배지, 상태 라벨
      labelSmall: AppTextStyles.s11w500,
    ),

    // =========================
    // 📌 AppBar Theme
    // =========================
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.s20w600.copyWith(
        color: AppColors.textPrimary,
      ),
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
    ),

    // =========================
    // 🔘 Elevated Button Theme
    // =========================
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary500,
        foregroundColor: AppColors.white,

        /// 버튼 텍스트는 본문보다 살짝 강조된 느낌
        textStyle: AppTextStyles.s16w400,

        disabledBackgroundColor: AppColors.border,
        disabledForegroundColor: AppColors.textSecondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        minimumSize: const Size.fromHeight(52),
      ),
    ),

    // =========================
    // 🔘 outlined Button Theme
    // =========================
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: const BorderSide(color: AppColors.primary500),
        padding: const EdgeInsets.symmetric(vertical: 14),
        disabledBackgroundColor: AppColors.white,
        disabledForegroundColor: AppColors.gray400,
        disabledIconColor: AppColors.gray400,
      ),
    ),

    // =========================
    // 🧾 Input / TextField Theme
    // =========================
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      hintStyle: AppTextStyles.s12w400.copyWith(color: AppColors.gray400),
      labelStyle: AppTextStyles.s12w400.copyWith(
        color: AppColors.textSecondary,
      ),

      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.border),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary500),
        borderRadius: BorderRadius.circular(4),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(4),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.border),
        borderRadius: BorderRadius.circular(4),
      ),
    ),

    // =========================
    // 📦 Divider
    // =========================
    dividerTheme: const DividerThemeData(color: AppColors.border, thickness: 1),

    // =========================
    // 🎯 Floating Action Button
    // =========================
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondary500,
      foregroundColor: AppColors.white,
      shape: const CircleBorder(), // 동그라미
    ),
  );
}
