import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';

class AppTextStyles {
  static const String fontFamily = 'Pretendard';

  // --- Title (제목) ---

  /// AppBar 타이틀, 메인 제목 (Size: 20, Weight: 600)
  static const s20w600 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  /// 카드 제목, 기기명, 가격 강조 (Size: 18, Weight: 600)
  static const s18w600 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  /// 카드 제목, 기기명, 가격 일반 (Size: 18, Weight: 500)
  static const s18w500 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  // --- Body (본문) ---

  /// 기본 본문, 주요 설명 (Size: 16, Weight: 400)
  static const s16w400 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  /// 기본 본문, 주요 설명 (Size: 16, Weight: 400)
  static const s16w600 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  /// 보조 설명 (Size: 12, Weight: 400)
  static const s12w400 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  // --- Label ---

  /// 배지, 상태 라벨 (Size: 11, Weight: 500)
  static const s11w500 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );
}



// AppTextStyles.s18w500.copyWith(color: AppColors.gray400)
// 를
// AppTextStyles.s18w500.gray400
// 처럼 사용가능
// 가독성 향상 및 개발 편의성 향상
extension TextStyleExt on TextStyle {
  TextStyle get gray400 {
    return copyWith(color: AppColors.gray400);
  }
}
