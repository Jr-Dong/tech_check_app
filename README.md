# 📱 TechCheck (테크체크)
<img width="255" height="37" alt="techcheck_logo" src="https://github.com/user-attachments/assets/1f731e25-1717-4a58-82a9-ea3cb24e2a57" />
</br>
**전문가가 검수하는 안심 IT 기기 중고거래 플랫폼**

 정보 비대칭으로 인한 중고 거래의 불안함을 '디지털 검수표'와 '전문가 검증 프로세스'로 해결하는 신뢰 기반 마켓플레이스입니다.

---

## 🛠 Tech Stack & Libraries

### **Environment**

- **Flutter**: `3.38.5` (stable)
- **Dart**: `3.10.4`
- **Tools**: DevTools `2.51.1`

### **Libraries**

- **State Management**: `StatefulWidget` (UI-Level State Control)
- **Formatting**: `intl` (Currency & Number formatting)
- **UI Components**: `carousel_slider` (Image Slider)

---

## 🚀 Key Features

프로젝트 요구사항(Lv.1 ~ Lv.6)을 충실히 구현하였으며, 사용자 경험(UX) 고도화에 집중했습니다.

### 1. 상품 마켓플레이스 (Product List)

### 1. 그리드 기반 상품 마켓플레이스 (Product List)

- **그리드 레이아웃 최적화**: `GridView.builder`를 사용하여 대량의 상품 데이터를 효율적으로 렌더링하고, 사용자에게 한눈에 들어오는 격자형 UI를 제공합니다.
- **데이터 포맷팅**: `intl` 패키지를 사용하여 가격에 세 자리마다 콤마(,)를 추가하고, 0원인 경우 '무료 나눔'으로 표시하는 예외 처리 로직을 적용했습니다.
- **빠른 접근성**: `FloatingActionButton`을 통해 상품 등록 페이지로 진입할 수 있습니다.

### 2. 인터랙티브 상세 페이지 (Product Detail)

- **이미지 슬라이더**: `carousel_slider` 패키지를 활용하여 여러 장의 상품 이미지를 매끄러운 스와이프 애니메이션으로 제공합니다.
- **실시간 가격 계산**: `setState`를 활용해 구매 수량 조절 시 결제 예정 금액이 실시간으로 합산되도록 구현했습니다.
- **안전한 구매 흐름**: Alert Dialog을 통해 사용자의 최종 구매 의사를 확인합니다.

### 3. 검증 시스템을 포함한 등록 폼 (Registration)

- **데이터 무결성**: `TextFormField`의 `validator`를 사용하여 필수 항목 누락 시 등록을 방지합니다.
- **사용자 편의성**: 이미지 선택 시 시각적 피드백을 제공하며, 가격 입력 시 숫자 전용 키보드가 나타나도록 설정했습니다.

### 4. 스마트 장바구니 (Shopping Cart)

- **중복 로직 처리**: 이미 담긴 상품을 추가할 경우 새로운 항목을 생성하지 않고 기존 수량에 합산되는 로직을 구현했습니다.
- **상태 관리**: 아이템 삭제 기능 및 장바구니가 비었을 때의 전용 Empty UI를 처리했습니다.

---

## 📂 Project Structure

기능을 기준으로 디렉토리를 구조화하여 유지보수성을 높였습니다.

```text
lib/
├── core/                  # 공통 테마, 색상, 폰트 및 공통 위젯
│   ├── widgets/           # 공통 앱바, 버튼, 카운터 컨트롤러 등
│   ├── app_colors.dart    # 브랜드 컬러 정의
│   └── app_theme.dart     # 전역 앱 테마 설정
├── model/                 # 데이터 엔티티 (CartItem, ProductEntity)
├── pages/                 # 기능별 페이지 단위 구성
│   ├── product_detail/    # 상세 페이지 및 Carousel Slider 위젯
│   ├── product_list/      # 목록 페이지 및 리스트 아이템 위젯
│   ├── product_wishlist/  # 찜하기 페이지
│   ├── product_register/  # 등록 폼 및 섹션별 위젯
│   └── shopping/          # 장바구니 및 결제 요약 위젯
└── main.dart              # 앱 진입점
```

## 👥 팀원 및 역할 (Contributors & Roles)

| 이름       |       역할        | 주요 구현 내용                                                                                                                                                                                                                  |
| :--------- | :---------------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **김동준** | **Leader / Core** | - **상품 목록**: `GridView.builder`를 활용한 메인 리스트 UI 및 필터링 로직 구현<br>- **장바구니**: 전역 상태 관리를 통한 아이템 추가/삭제 및 수량 합산 로직 설계                                                                |
| **김현서** |  **UI/UX / Dev**  | - **상품 등록**: `Form` 위젯과 `Validator`를 활용한 데이터 입력 UI 및 유효성 검사 로직 구현<br>- **장바구니**: 사용자 친화적인 장바구니 리스트 및 결제 요약 카드 UI 디자인<br>- 공통 위젯(`CommonEmptyView` 등) 개발            |
| **지은성** | **Feature / Dev** | - **상품 상세**: `carousel_slider`를 이용한 이미지 슬라이더 및 제품 상세 정보 레이아웃 구현<br>- **인터랙션**: `StatefulWidget`을 활용한 실시간 수량 조절 및 총액 계산 로직 구현<br>- 상세 페이지 내 구매 안내 팝업 시스템 구축 |

---

## 🛠️ 개발 기간 (Timeline)

- **2025.12.29 ~ 2025.12.31**
- **기획**: 아이디어 브레인스토밍 및 UI/UX 와이어프레임 설계
- **개발**: 필수 기능(Lv.1~3) 및 도전 기능(Lv.4~6) 단계별 구현

---

## 설치 및 실행 방법 (Installation & Run)

### ⚙️ Installation & Run

#### 1. 저장소를 클론합니다.

```bash
git clone [https://github.com/Jr-Dong/tech_check_app.git](https://github.com/Jr-Dong/tech_check_app.git)
```

#### 3. 패키지를 설치합니다.

```bash
cd tech_check_app
```

#### 4. 패키지를 설치합니다.

```bash
flutter pub get
```

#### 5. 앱을 실행합니다.

```bash
flutter run
```
