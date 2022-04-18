import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive/controllers/menucontroller.dart';

import '../../../constants.dart';

// 웹 메뉴 클래스 이다.
class WebMenu extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  // 웹 메뉴에 대한 컨트롤을 위해 컨트롤러를 Get.put으로 가지고 왔다.

  @override
  Widget build(BuildContext context) {
    return Obx( // Obx() 는 Getx에서의 상태관리법중 simple 방식중 하나로 메모리를 가장 적게 사용하는 장점이 있다.
      // Obx() 는 Getx보다 더 간단한 방법이다. 다만 Obx()의 경우 사용할 컨트롤러의 종류를 따로 명시할
      // 필요가 없고 보여줄 위젯만 리턴하면 된다. 하지만 이 방법에서는
      // 무조건 Get.put()을 필요로 한다.
            () => Row( // 웹 메뉴를 가로로 나열 할 것이니 Row() 로 감싸자.
          children: List.generate( // List.generate는 배열 형태의 map 형식이다.
            // 따라서 children을 배열형이 여야 하지만 List.generate가 배열 형태이기 때문에
            // [] 를 안쓰고 바로 List.generate를 사용할 수 있었다.
            // 이 List.generate는 첫번째 인자로 length, 두 번째 인자로  index를 받는 콜백 함수를 받는다.
            _controller.menuItems.length,
                // 컨트롤러에서 생성한 menuItme의 길이를 첫번째 인자로 한다.
                (index) => // 두번째 인자로 콜백함수 인데 이 콜백함수는 index를 인자로 받는다.
                // 인자는 해당 menuItems의 index를 가리킨다.
                WebMenuItem( // 바로 밑에 WebMenuItem이라는 클래스를 만들 것이다.
                  text: _controller.menuItems[index],
                  // text는 menuItems의 index의 값을 map 돌며 출력할 것이고,
                  isActive: index == _controller.selectedIndex,
                  press: () => _controller.setMenuIndex(index),

                  // press로 인해서 setMenuIndex함수가 호출된다.
                  // 이러면서 selectedIndex의 값이 바뀌게 되고,
                  // selectedIndex(내가 선태한 메뉴)와  index(나열되어있는 메뉴)가 같다면
                  // isActive 값을 true로 바꿔준다.
                ),
          ),
        ));
  }
}

// WebMenuItem 은 인자로 isActive, text, press 를 받는다.
class WebMenuItem extends StatefulWidget {
  final bool isActive;
  final String text;
  final VoidCallback press;

  const WebMenuItem({Key? key,
    required this.isActive,
    required this.text,
    required this.press})
      : super(key: key);

  @override
  _WebMenuItemState createState() => _WebMenuItemState();
}

class _WebMenuItemState extends State<WebMenuItem> {
  bool _isHover = false;
  // Hover 값은 false로 초기값 설정을 해준다.
  // 어찌보면 이건 당연한것..!!

  // borderColor에 대한 함수 이다.
  Color _borderColor() {
    if (widget.isActive) {
      // 만약 isActive가 true 라면 kPrimaryColor를 반환하고
      return kPrimaryColor;
    } else if (!widget.isActive & _isHover) {
      // isActive가 false이며, isHover가 false
      // 즉, 선택하지 않고, 마우스만 메뉴에 올려 놨으면
      // kPrimaryColor에서 투명도를 0.4 만큼 부여한다.
      return kPrimaryColor.withOpacity(0.4);
    }
    return Colors.transparent;
    // 얘는 선택도, 마우스도 안올려놨으면 투명하게 둔다.
    //
  }

  @override
  Widget build(BuildContext context) {
    return InkWell( // 제스처기능이 없는 위젯에 어떤 제스쳐 기능을 제공하고자 할때 사용한다.
      onTap: widget.press, // 메뉴를 클릭시 press 함수 호출
      onHover: (value) { // onHover 시 value 값이 자동으로 입혀진다.
        // 그 부분을 state의 값을 변경시켜야 하기 때문에
        // setState를 사용했으며, onHover는 boolean값을 가진다. 따라서 isHover 값을 바꿔줄 수 있다.
        setState(() {
          _isHover = value;
        });
      },
      child: AnimatedContainer( // animatedContainer의 경우 해당 하는곳에 duration을 줘서
        // 애니메이션으로 보여지게 하는 것이다.
        // 이것을 사용한 이유는 우리는 메뉴가 onhover시에 borderBottom이 자연스레 나오고 자연스레 사라지게
        // 하기 위함이다.
      duration: kDefaultDuration,
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: _borderColor(), width: 3),
        ),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.normal
        ),
      ),
    ),);
  }
}


















