import 'package:flutter/material.dart';
import 'package:responsive/constants.dart';

import '../../models/blog.dart';
import '../../responsive.dart';
import 'components/blog_post.dart';
import 'components/categories.dart';
import 'components/recent_posts.dart';
import 'components/search.dart';

// 모델 / 블로그 다트 파일
// responsive 다트 파일

// 블로그 포스트 다트파일
// 카테고리 다트파일
// recent 포스트 파일
// search 파일

class HomeScreen extends StatelessWidget {
  // HomeScreen 에 대한 클래스를 StatelessWidget 으로 선언한다.
  // 그 안의 부수적인 부분을 Stateful로 작성할 것 같음
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // 홈 스크린은 블로그 글, 그 옆에 검색, 카테고리 등등 2종류로 나눌것이기 때문에
      // 처음 부분을 Row로 감싼뒤 Column()으로 감쌀것이다.
      // 위에서 아래로 내용을 볼 거니까 ..;;
      children: [
        Expanded(  // overflow를 방지하지 위한 위젯이다.
          flex: 2, // flex 값을 2로 한다면 전체 차지하는 비중을 블로그가 더 많이 차지 할 것이다.
          // 사실 이것또한 개인적인 디자인 취향이라고 생각한다.
          // 실험해본 후 본인의 취향에 맞게 설정하는게 좋다고 본다.
          child: Column( // 아까 말한대로 Column으로 감쌌다.
            children: List.generate(blogPosts.length,
                // List.generate는 우리가 흔히 하는 map 함수와 비슷하다. 그러나 이 코드에서는
                // 다른점이 있다.
                // children은 배열 값을 가진다. 하지만 여기엔 쓰이지 않았다.
                // 그렇다면 이말은 무슨말이냐 ~~?
                // List.generate 가 배열이라는 소리다. 즉, 배열이 면서
                // map 함수처럼 지정한 해당 아이템(blogPosts)의 length 만큼 아이템을 돈다는 소리다.
                (index) => BlogPostCard(blog: blogPosts[index])),
            // 이 콜백함수는 index를 인자로 받는데, BlogPostCard라는 클래스를 하다 만들 것이고,
            // 그 클래스와 index를 사용해서 동작하게 할 것이다.
            // 결과를 먼저 말하자면 블로그 포스트를 index 만큼 map 돌면서 출력시킨다는 것이다.
          ),
        ),
        if(!Responsive.isMobile(context)) SizedBox(width: kDefaultPadding),
        // 만약 모바일 너비가 아니라면 Sizedbox의 width값을 kDefaultPadding만큼 가진다.
        // SideBar
        if(!Responsive.isMobile(context))
          // 만약 모바일 너비가 아니라면 검색, 카테고리 RecentPosts 를 보여달라는 것이다.
          // 모바일 너비시에는 안보여 준다는 것이다.
          Expanded(child:
            Column(
              children: [
                Search(),
                SizedBox(height:  kDefaultPadding,),
                Categories(),
                SizedBox(height: kDefaultPadding,),
                RecentPosts()
              ],
            )
          )
      ],
    );
  }
}
