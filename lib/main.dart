import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive/constants.dart';
import 'package:responsive/screens/main/main_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Getx 으로 인해 상태관리를 하기 위해 main.dart 에서 반혼 위젯을 GetMaterialApp 으로 감싸았다.
      title: 'Responsive App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: kPrimaryColor)
        ),
        textTheme: const TextTheme(
          bodyText1:  TextStyle(color: kBodyTextColor),
          bodyText2:  TextStyle(color: kBodyTextColor),
          headline5: TextStyle(color: kDarkBlackColor)
        ),
      ),
      // 사실상 위에 있는 것들을 전부 디자인적 요소다. 반응형이라고는... 딱히... 신경쓸필요없다.
      // 개인취향 대로 공부해서 꾸미길 바란다...
      // 본인도 공부해서 꾸며야 함..허헣...
      home: MainScreen(),
    );
  }
}
