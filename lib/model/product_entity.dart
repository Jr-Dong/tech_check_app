class ProductEntity {
  final String id; // 상품 고유 ID
  final String name; // 상품 이름
  final String description; // 상품 설명
  final int price; // 가격
  final List<String> images; // 이미지
  final bool isVerified; // 검증 여부

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    this.isVerified = false,
  });
}
