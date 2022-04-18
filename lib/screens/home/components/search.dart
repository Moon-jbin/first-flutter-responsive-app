import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import 'sidebar_container.dart';

class Search extends StatelessWidget {
  // input태그에 관한 클래스 위젯이다.

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      // 절대 기존 위젯이 아니다. sidebar_container.dart 파일에서 만든 클래스 위젯이다.
        title: "Search",
        child: TextField(
          // 이자식은 기존 위젯임. input태그 위젯이니 알아둘것 허허...
          onChanged:  (value){}, // 해당 input 태그 안의 데이터가 변동할때마다
          // 관찰해주는 역활을 한다. 나중에 검색 기능, todolist 같은 기능 사용할때 유용할 것이다.
          decoration: InputDecoration(
            // input을 데코하는 위젯
            hintText: "Type Here ...",
            // css로 치면 placeholder 값을 주는 거라고 보면 된다.
            suffixIcon: Padding(
              // input 태그 안에 이미지를 넣느것이다.
              // css 였으면 한땀한땀 다 했어야 하는데, 위치까지 적당하게 잘 잡아 주는거 보면
              // flutter가 대박이긴 대박이다. 알아두면 겁나 편한......와씨....현타 오겠어..이러다가..
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              child: SvgPicture.asset("assets/icons/feather_search.svg"),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(kDefaultPadding /2)
              ),
              borderSide:  BorderSide(color: Color(0xffcccccc))
            )
          ),
        )
    );
  }
}