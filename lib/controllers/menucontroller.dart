import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class MenuController extends GetxController {
  //GetxController는   비교적 간단한 방식이다.
  RxInt _selectedIndex = 0.obs;

  // RxInt, .obs 는 getx 라이브러리의 속성으로 실시간으로 데이터를 관찰해 주는 역할을 합니다.
  // Rx(observable 변수) 의 값을 접근 할때는 일반 변수와 다르게 .value를 통해 접근할 수 있다.

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // ScaffoldState GlobalKey는 해당 scaffold를 제대로 찾아가기 위해, 즉 피아식별을 위한
// 키값이라고 보면 된다. 앞서 이 키는 main.dart에서 key속성에 넣을 것이다.

  int get selectedIndex => _selectedIndex.value;

  // get을 사용한다면 read를 한다는 뜻이다. 즉, 해당 변수가 private 인데 이를 불러들이기만 한다는 뜻이다.

  List<String> get menuItems =>
      ["Cases", "Services", "About Us", "Careers", "Blog", "Contact"];

  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldKey;
    // scaffoldkey도 get으로 불러들여서 값을 바꾸는 목적이 아닌 그대로 사용만 하기 위해서 get으로 불러들였다.

  void openOrCloseDrawer() {
    // 이 함수는 사이드메뉴(Drawer)가 열려 있다면 닫게, 닫혀있다면 열게 해주는
    // 함수이다.
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void setMenuIndex(int index) {
    // 이 함수는 해당 메뉴에 대한 index를 관리하는 함수이다.
    // 향후 이 메뉴로 인해서 isActive 로 true, false를 결정짓게 할 것이다.
    _selectedIndex.value = index;
    // 위에서 설명한 대로 .value로 접근해 값을 index로 바꿔주고 있다.
  }
}
