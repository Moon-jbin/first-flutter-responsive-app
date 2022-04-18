import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

// 이 사이드 박스의 쓰임은 다음과 같다.

// search, 카테고리, Recent Post 들의 자리를 마련해 주는 역할이다.
// 즉, 결국 같은 코드로 작성해야 할 코드를 하나의 코드로 하여
// 코드를 줄이기 위해 이렇게 클래스 위젯으로 만들어서
// 편하게 쓰는 것이다.


class SidebarContainer extends StatelessWidget {
  // sidebarContainer에 대한 클래스 위젯이다.

  final String title;
  final Widget child;
// 이 클래스는 인자로 title, child를 받는다.
  const SidebarContainer({Key? key, required this.title, required this.child}) : super(key: key);


  @override
  // 다른 기존의 설명을 다 봤다면 이번 설명은 각자 해석해 보도록 하자 !
  // 딱히 반응형에 대한 설명도 아니기도 하니 쉬울 것이다.
  // 아니면 써보고 색상을 변경하거나, 안의 속성값을 변경해서
  // 어떤식으로 사용되고 구조가 어떤지 파악하면 좋을 것 같다.
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(kDefaultPadding / 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: kDarkBlackColor,
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: kDefaultPadding /2,),
          child
        ],
      ),
    );
  }
}