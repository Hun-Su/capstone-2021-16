import 'package:project1/pages/addpromise.dart';
import 'package:project1/pages/calendar.dart';
import 'package:project1/pages/friends.dart';
import 'package:project1/pages/home.dart';
import 'package:project1/pages/message.dart';
import 'package:project1/pages/notice.dart';
import 'package:project1/pages/profile.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentPageIndex; // 페이지 인덱스

  @override // 데이터 다루는 곳
  void initState() {
    super.initState();
    _currentPageIndex = 0; //현재 페이지 인덱스 ( 홈 )
  }

  Widget _appbarWidget() {
    return AppBar(
      // AppBar
      title: GestureDetector(
        onTap: () {
          // 클릭했을 때 Callback이 이 쪽으로 옴
          print("click");
        },
        child: Row(
          children: [
            SizedBox(width: 5), //Padding이랑 같은 효과
            Text("알약"),
          ],
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => Message()), // Move to Message
             );
              }, icon: Image.asset('assets/images/message.png')),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notice()), // Move to Notice
              );
            }, icon: Image.asset('assets/images/bell.png'))
      ], // 가운데 이름
    );
  }

  /// 네비게이션 분기하는 로직
  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return Home(); // 홈 화면
        break;
      case 1:
        return Friends(); // 친구 목록 페이지
        break;
      case 2:
        return AddPromise(); // 약속추가페이지
        break;
      case 3:
        return Calendar(); // 캘린더 페이지
        break;
      case 4:
        return Profile(); // 프로필 페이지
        break;
    }
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
      icon: Image.asset('assets/images/${iconName}.png'),
      label: label,
    );
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 네비게이션바 애니메이션
        onTap: (int index) {
          print(index);
          setState(() {
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex,
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.black),
        items: [
          _bottomNavigationBarItem("home", "홈"),
          _bottomNavigationBarItem("friends", "친구"),
          _bottomNavigationBarItem("plus", "약속추가"),
          _bottomNavigationBarItem("calendar", "알림"),
          _bottomNavigationBarItem("profile", "프로필"),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
      endDrawer: Drawer(
        child: Text("슬라이드 메뉴"),
      ),
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
    );
  }
}
