import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class DesignSystemPreviewPage extends StatelessWidget {
  const DesignSystemPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Design System Preview')),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Secondary FAB
          FloatingActionButton(
            heroTag: 'fab-secondary',
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       // return ProductRegister();
              //     },
              //   ),
              // );
            },
            child: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===============================
            // Text Styles
            // ===============================
            const Text('Text Styles', style: AppTextStyles.s20w600),
            const SizedBox(height: 16),

            _textSample('s20w600 - AppBar / 메인 제목', AppTextStyles.s20w600),
            _textSample('s18w600 - 카드 제목 / 가격 강조', AppTextStyles.s18w600),
            _textSample('s18w500 - 카드 제목 일반', AppTextStyles.s18w500),
            _textSample('s16w400 - 본문 텍스트', AppTextStyles.s16w400),
            _textSample('s12w400 - 보조 설명', AppTextStyles.s12w400),
            _textSample('s11w500 - 라벨 / 배지', AppTextStyles.s11w500),

            const SizedBox(height: 32),

            // ===============================
            // Buttons
            // ===============================
            const Text('Buttons', style: AppTextStyles.s20w600),
            const SizedBox(height: 16),

            /// Primary Button - Enabled
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Primary Button (Enabled)'),
              ),
            ),
            const SizedBox(height: 8),

            /// Primary Button - Disabled
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null, // 🔥 비활성
                child: const Text('Primary Button (Disabled)'),
              ),
            ),

            const SizedBox(height: 16),

            /// Outlined Button - Enabled
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined Button (Enabled)'),
              ),
            ),
            const SizedBox(height: 8),

            /// Outlined Button - Disabled
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: null,
                child: const Text('Outlined Button (Disabled)'),
              ),
            ),

            // ===============================
            // Text Fields
            // ===============================
            const Text('Text Fields', style: AppTextStyles.s20w600),
            const SizedBox(height: 16),

            /// Default TextField
            TextField(
              decoration: InputDecoration(
                labelText: '기본 입력',
                hintText: '내용을 입력하세요',
              ),
            ),

            const SizedBox(height: 12),

            /// Error TextField
            TextField(
              decoration: InputDecoration(
                labelText: '에러 상태',
                hintText: '잘못된 입력',
                errorText: '필수 항목입니다',
              ),
            ),

            const SizedBox(height: 12),

            /// Disabled TextField
            TextField(
              enabled: false,
              decoration: InputDecoration(labelText: '비활성화', hintText: '입력 불가'),
            ),
          ],
        ),
      ),
    );
  }

  /// 텍스트 스타일 미리보기용 위젯
  Widget _textSample(String label, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: style.copyWith(color: AppColors.textPrimary)),
          const SizedBox(height: 4),
          Text(
            'The quick brown fox jumps over the lazy dog',
            style: style.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
