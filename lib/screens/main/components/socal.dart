import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import '../../../responsive.dart';

// 소셜 클래스이다.
class Socal extends StatelessWidget {
  const Socal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row( // 소셜 클래스는 소셜 아이콘 밒 대화 버튼을  포함 시킨다.
      // 우선 수평으로 나열하기 위해 Row()로 감싸준다.
      children: [
        if(!Responsive.isMobile(context))
          SvgPicture.asset("assets/icons/behance-alt.svg"),
        if(!Responsive.isMobile(context))
          Padding(padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding /2),
            child: SvgPicture.asset("assets/icons/feather_dribbble.svg"),
          ),
        if(!Responsive.isMobile(context))
          SvgPicture.asset("assets/icons/feather_twitter.svg"),
        // 위의 3개의 if 문이 전부 모바일 버전이 아닐 경우에는 3개의 소셜 아이콘이 보이게 한다.

        const SizedBox(width: kDefaultPadding,),
        ElevatedButton(onPressed: (){}, child:
            // 대화 버튼을 생성하는데, 스타일 적인 부분만 있기 때문에 설명은 생략한다.
          const Text("Let's Talk"),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical: kDefaultPadding / (Responsive.isDesktop(context)? 1 : 2)
                // 이 부분은 해석을 잘 해야 한다.
              // 이상하게 해석해서 패딩값이 boolean 값이랑 나눠지면? 이라고 해석 하다간 혼란이온다.
              // 해당 데스크 탑 크기라면 1 아니면 2 라는 값을 가지면서
              // 그 값이 패딩값과 계산되는 것이다.
            )
          ),
        )
      ],
    );
  }
}