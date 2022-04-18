import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'sidebar_container.dart';

class RecentPosts extends StatelessWidget {

  // RecentPost의 클래스 위젯이다.
  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      // SidebarContainer 라는 위젯이 실제 있는게 절대 아니다.
      // 오해 하지 말자. 이는 카테고리에서 직접 만든 클래스 위젯처럼 직접 만든 클래스 위젯이다.
      // 확인은 위제서는 sidebar_container.dart 파일로 이동하면 된다.
        title: "Recent Post", child: Column(
      children: [
        RecentPostCard( // 이자식 또한 같다. 바로 아래에서 만든 직접 만든 클래스 위젯이다.
          image: "assets/images/recent_1.png",
          title:'우리의 비밀 워크샵',
          press:(){}
        ),
        SizedBox(height: kDefaultPadding,),
        RecentPostCard(
          image: "assets/images/recent_2.png",
          title: "사랑으로 부터온 제품 혁신",
          press: (){}
        )
      ],
    )
    );
  }
}

// 이 클래스 위젯은 title, image, press를 인자로 받는다.
class RecentPostCard extends StatelessWidget {
  final String title, image;
  final VoidCallback press;

  const RecentPostCard({Key? key, required this.title, required this.image, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,    // 색상을 투명하게 했으며,
      child: InkWell( // 없는 곳에서 제스쳐 기능을 추가시키기 위해 InkWell이란 위젯을 사용했다.
        onTap: press,
        child: Row(
          children: [
            // 둘이 overflow를 방지하기 위해 expanded로 감쌌으며,
            //flex 2, 5 에 맞게 가로로 위치 시켜 보기 편하게 했다.
            Expanded(child:
               Image.asset(image),
              flex: 2,
            ),
            SizedBox(width: kDefaultPadding,),
            Expanded(
              flex: 5,
                child: Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: "Raleway",
                    color: kDarkBlackColor,
                    fontWeight: FontWeight.bold,
                    height: 1.5
                  ),
                ))
          ],
        ),
      ),
    );
  }
}






















