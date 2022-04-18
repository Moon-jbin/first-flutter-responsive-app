import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'sidebar_container.dart';

//카테고리 클래스 위젯이다.
class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
        title: "카테고리",
        child: Column(
          // 카테고리 또한 Column 위젯으로 사용했다.
          // 당연히 위에서 아래로 위치 시킬거기 떄문이다. !
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Category(
                // 해당 카테고리는 아래에서 직접 만든 클래스 위젯이다.
                // 실제 있는것이 아니니 참고할 것 ..!!
                title: 'Artificial Intelligence',
                numOfItems: 3,
                press: () {}),
            Category(title: 'Augmented reality', numOfItems: 4, press: () {}),
            Category(title: 'Development', numOfItems: 10, press: () {}),
            Category(title: 'Flutter UI', numOfItems: 18, press: () {}),
            Category(title: 'Flutter UI', numOfItems: 12, press: () {}),
            Category(title: 'UI/UX Design', numOfItems: 8, press: () {}),
          ],
        ));
  }
}

// 위에 서 사용된 카테고리 클래스 위젯이다.
class Category extends StatelessWidget {
  // 이 카테고리는 보면 실제 위젯을 사용하는 것처럼 쓰져서 신기했다.
  // 따라서 잘 보고 배워보도록 하자.
  // 이 카테고리는 title, numOfItems, press를 인자로 받는다.
  final String title;
  final int numOfItems;
  final VoidCallback press;

  const Category(
      {Key? key,
      required this.title,
      required this.numOfItems,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding( // 우선 패딩값으로  전체 내부 여백을 여유있게 해준다.
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
      child: TextButton(
        // 각 카테고리를 hover시 cursor: porinter가 될 수 있게 TextButton 으로 한다.
        onPressed: () {
          //뭐 ..훗날 이부분은 해당 카테고리의 내용으로 들어가는 구문이 될 것이다.
        },
        child: Text.rich(TextSpan(
          // style이 생략되어 DefaultTextStyle이 적용된다.
          // 여러개의 다른 그타일을 가진 문자를 화면에 그려주게 한다.
            text: title,
            style: TextStyle(color: kDarkBlackColor),
            children: [ // 그 자식들에게도 차차 적용 시킬것이다.
              // 다만 그냥 Color를 같게 한듯한 느낌이다.
              TextSpan(
                  text: "($numOfItems)",
                  style: TextStyle(color: kBodyTextColor))
            ])),
      ),
    );
  }
}
