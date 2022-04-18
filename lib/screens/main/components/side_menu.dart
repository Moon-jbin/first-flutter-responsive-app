import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive/controllers/menucontroller.dart';

import '../../../constants.dart';

// 사이드메뉴에 대한 클래스 위젯이다.
class SideMenu extends StatelessWidget{
  final MenuController _controller = Get.put(MenuController());
  // 사이드메뉴에서 메뉴 컨트로러를 불러온 이유?
  // 사이드 메뉴에다가 모바일 버전일시 햄버거 버튼이 나온다.
  // 그 햄버거 버튼을 눌렀을때 사이드 메뉴가 나오게 할건데그 내용이 바로
  // 메뉴 컨트롤러에 있는 메뉴 아이템들 이며, 해당 기능을 사용하기 위해 메뉴 컨트롤러를 불러온것이다.
  @override
  Widget build(BuildContext context) {

    return Drawer( // 햄버거를 눌렀을 시 Drawer()위젯 호출
      child: Container(
        color: kDarkBlackColor,
        child: Obx(() => ListView( // Getx 보다 쉬운 simple방식의 Obx() 상태관리
          // 사이드 메뉴가 나왔을때 스크롤를 할 수 있도록 하기 위해서 ListView 위젯을 사용했다.
          children: [
            DrawerHeader( // Drawer 의 헤더 부분을 담당한다. 주로 로고, 큰 제목을 할때 사용한다.
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 3.5),
                child: SvgPicture.asset("assets/icons/logo.svg"),
              ),
            ),
            ...List.generate(
              // 이전에서는 children에 다가 List.generate만 사용했기 때문에
              // [] 이 부분을 없애고 사용했지만 ,
              // 이번에는 DrawerHeader()가 사용되고 있기 떄문에 [] 를 없애는 것은 불가능하다.
              // 따라서 전개연산자를 사용해 배열안의 값만 배열속으로 집어넣는 방법을 사용했다.
                _controller.menuItems.length,
                    (index) => DrawerItem(
                    isActive: index == _controller.selectedIndex,
                    title: _controller.menuItems[index],
                    press: () => _controller.setMenuIndex(index)))
          ],
        )),
      ),
    );
  }

}

// DrawerItem은 인자로 title, isActive, press를 받는다.
class DrawerItem extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback press;

  const DrawerItem({Key? key, required this.title, required this.isActive, required this.press}) : super(key: key);

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        selected: widget.isActive,
        selectedTileColor: kPrimaryColor,
        onTap: widget.press,
        title: Text(
          widget.title,
          style: const TextStyle(color:Colors.white),
        ),
      ),
    );
  }
}















