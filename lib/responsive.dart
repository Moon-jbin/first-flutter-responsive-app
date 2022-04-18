import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  // responsive 클래스는 인자로 mobile, tablet, desktop을 받습니다.
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive(
      {Key? key, required this.mobile, required this.tablet, required this.desktop })
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;
  // isMobile 이란 애는 650보다 작은 디바이스 가로 크기를 반환 합니다.
  // 훗날 이 녀석으로 if문 으로 다가 디바이스  가로 크기를 이용해 반응형 으로 만들 것입니다.

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 900 &&
  MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width  >= 910 ;
  // 같은 내용이므로 생략하겠습니다 !




  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // 부모 위젯 사이즈에 의존하는 위젯 트리를 만듭니다.
      // LayoutBuilder의 build메소드안에서 maxwidth와 같은 widget의 사이즈 정보를 가져올 수 있습니다.
        builder: (context, constraints) {
          // constraints는  제한한 박스 컨테이너의 크기
          if (constraints.maxWidth >= 900) {
            return desktop;
          }
          else if (constraints.maxWidth >= 650) {
            return tablet;
          }
          else {
            return mobile;
          }
        }
    );
  }
}