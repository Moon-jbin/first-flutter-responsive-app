import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive/controllers/menucontroller.dart';
import 'package:responsive/screens/main/components/side_menu.dart';
import '../../constants.dart';
// import '../home/home_screen.dart';
import '../home/home_screen.dart';
import 'components/header.dart';


class MainScreen extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());
// 메인스크린 위젯이다.
  // 메뉴 컨트롤러를 받은 이유는 메인 컨트롤러에 scaffoldkey 값을 받아놔서
  // 그 부분을 사용하기 위해 불렀다.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldkey,  // <--- 바로 이놈때문에 메뉴컨트롤러를 불러옸다.
      drawer:SideMenu(),
      body: SingleChildScrollView(
        // SingleChildScrollView() 위젯은 overflow시 넘치는 오류가 안생기도록 하기 위해
        // 스크롤을 할수 있게 하는 위젯이다.
        // 보통은 ListView() 위젯을 사용한다고도 하는데 여기는 이걸 사용한 것 같다.
        child: Column( // 위에서 아래로 내리기 위해 Column위젯으로 감쌌다.
          children: [
            Header(),
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              // constraints는 해당 자식 요소의 너비값을 제한합니다.
              // 자식 너비가 최대 kMaxWidth(1232)만크만 늘어나게 해준다.
              child: SafeArea( // SafeArea는 자식요소를 잘려서 보이는 것을
                //방지 시키는 역할을 하는 위젯입니다.
                child: HomeScreen(),
              ),
            )
          ],
        ),
      ),
    );
  }
}


