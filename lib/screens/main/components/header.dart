import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive/controllers/menucontroller.dart';
import 'package:responsive/responsive.dart';
import 'package:responsive/screens/main/components/socal.dart';
import 'package:responsive/screens/main/components/web_menu.dart';
import '../../../constants.dart';

class Header extends StatelessWidget {
  // 헤더 클래스를 statelessWidget에서 확장시켰다.
  final MenuController _controller = Get.put(MenuController());
// 메뉴 컨트롤러가 불러온 이유는 다음과 같다.
  // 헤더에는 데스크탑 너비가 아닐시 햄버거 메뉴버튼이 생길것이다.
  // 그때 메뉴 버튼을 클릭하면 Drawer 가 동작 되는데
  // 그 기능을 컨트롤하는 기능을 가져오기 위해 메뉴 컨트롤러를 불러들인것이다.

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kDarkBlackColor,
      child: SafeArea( // 화면으로부터 잘리는 부분을 방지하기 위해 SafeArea()로 감쌌다.
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: kMaxWidth),
              // 최대 커지는 너비를 제한한 것이다.
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      if(!Responsive.isDesktop(context))
                        // 만약 데스크탑 버전이 아니라면  햄버거 메뉴가 생기면서 그 버튼을 눌렀을 시
                        // Drawer가 동작하게 한다.
                         IconButton(onPressed: () {
                          _controller.openOrCloseDrawer();
                        },
                            icon: const Icon(Icons.menu, color: Colors.white,)),
                      SvgPicture.asset("assets/icons/logo.svg"),
                      Spacer(), // Spacer 는 요소와 요소사이를 가능한 최대치로 멀리 벌려준다.
                      // 이를 잘 이용하면 깔끔한 UI를 만들 수 있다.
                      if(Responsive.isDesktop(context)) WebMenu(),
                      // 만약 데스크탑 너비라면 WebMenu()를 호출한다.
                      Spacer(),
                      //Socal
                      Socal()
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding * 2,),
                  const Text(
                    'Welcome to Our Blog',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(
                      "Stay updated with the newest design and development stories, case studies, \nand insights shared by DesignDK Team.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          height: 1.5
                      ),
                    ),
                  ),
                  FittedBox( // FittedBox 는 Fit속성에 맞춰서
                    //자식요소의 크기비율과 위치를 부모요소에 맞춰서 보여주는 역활을 한다.
                    // 예전 메카it아카데미에서 starBucks 이미지를 그리드 형식으로
                    // 이미지 크기를 맞춘것을 생각하면 편하게 해주는 것이다...
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Text(
                            "Learn More",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(width: kDefaultPadding / 2,),
                          Icon(
                              Icons.arrow_forward,
                              color: Colors.white
                          )
                        ],
                      ),
                    ),
                  ),
                  if(Responsive.isDesktop(context))
                    const SizedBox(height: kDefaultPadding,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}