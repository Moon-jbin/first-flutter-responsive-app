import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive/models/blog.dart';
import 'package:responsive/responsive.dart';
import '../../../constants.dart';

// 블로그 포스트 카드에 대한 위젯 클래스이다.
class BlogPostCard extends StatelessWidget {
  final Blog blog; // BlogPostCard 는 인자로 blog를 받는다

  const BlogPostCard({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding:
      const EdgeInsets.only(bottom: kDefaultPadding),
      child: Column( // 블로그 포스트 카드 자체는 위 에서 아래로 내려 갈 것이기 때문에
        // Column 으로 감싸준다.
        children: [
          AspectRatio(aspectRatio: 1.78,
          // 부모 영역 안에서 자식의 크기를 설정된 가로 세로 비율로 맞춘다.
            // css에서 position을 비율로 배치 하는 느낌이라고 보면 좋을 것 같다.
            // 사실 뜻 자체는 FittedBox() 와 비슷하다고 생각 하기 때문에
            // 사용할 시 개념을 다시 보고 사용하는것이 좋다고 생각한다.
          child: Image.asset(blog.image!),
            // 설정한 비율로 블로그 이미지를 출력한다.
          ),
          Container( // 그 다음  2번째 요소 로는 블로그에 해당하는 description들 이다.
            // 즉, 이 블로그 카드는 전체적으로 2개로 분류 됐다. AspectRatio, Container
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: const BoxDecoration(
              // 우선 이 컨테이너의 borderBottom 값을 약간 둥글게 해준다.
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
              ),
            ),
            child: Column(
              // 그리곤 내용을 위에서 부터 아래로 가기 위해 Column 값을 주었으며,
              // CrossAxisAlignment.start로 인해 맨 위에서 시작하게 한다.
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 맨위에서 부터 Design, 포스팅 날짜 를 가로로 위치 시키기 위해 Row()로 감싼다.
                Row(
                  children: [
                    Text(
                      "Design".toUpperCase(),
                      style: const TextStyle(
                        color: kDarkBlackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(width: kDefaultPadding,),
                    Text(
                      blog.date!,
                      // 이전에 blog.dart 파일에서
                      // String? 으로 받을 인자들을 선언했다.
                      // 이는 문자열될 수도 있고, null이 될수도 있다는 뜻인데,
                      // Dart는 null safety를 지원한다. 따라서
                      // 뒤에 ! 를 붙인다면, 이 변수는 null을 절대 가지지 않는 변수다 라고
                      // 말하는 것과 같다.
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                Padding(padding:
                    // 그 다음  패딩 값으로 감싸서 여유 공간을 주며 보여 준다.
                  const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Text(
                    blog.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    // 제목의 최대 길이가 2줄 이며, 넘칠 시 ... 표시로 대체 된다.
                    style: TextStyle(
                      fontSize: Responsive.isDesktop(context) ? 32 : 24,
                      fontFamily: "Raleway",
                      color: kDarkBlackColor,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                    blog.description!,
                  maxLines: 4,
                  style: const TextStyle(height: 1.5),
                ),
                const SizedBox(height: kDefaultPadding,),
                Row( // ReadMore 과 좋아요, 메세지, 공유 부분에서 가로로 나열하기 위해
                  //Row() 위젯을 사용한 것이다.
                  children: [
                    TextButton(onPressed: (){}, child:
                      Container(
                        padding: const EdgeInsets.only(bottom: kDefaultPadding / 4),
                        decoration:const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: kPrimaryColor, width: 3),
                          )
                        ),
                        child: const Text(
                          "Read More",
                          style: TextStyle(color: kDarkBlackColor),
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(onPressed: (){}, icon:
                      SvgPicture.asset("assets/icons/feather_thumbs-up.svg")
                    ),
                    IconButton(onPressed: (){}, icon:
                      SvgPicture.asset("assets/icons/feather_message-square.svg")
                    ),
                    IconButton(onPressed: (){}, icon:
                      SvgPicture.asset("assets/icons/feather_share-2.svg")
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
