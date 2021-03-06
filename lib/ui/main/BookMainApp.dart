import 'package:book_store/constant/AppCtx.dart';
import 'package:flutter/material.dart';
import 'bookshelf/BookShelfPage.dart';
import 'explore/ExplorePage.dart';
import 'my/MyPage.dart';
import 'rss/RssPage.dart';
import '../../constant/MyIcons.dart';

class BookMainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppCtx.context = context;
    return MaterialApp(
      title: '阅读',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        brightness: Brightness.light,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: MyIcons.home,
        activeIcon: MyIcons.home_s,
        tooltip: '书架',
        label: ''),
    BottomNavigationBarItem(
        icon: MyIcons.explore,
        activeIcon: MyIcons.explore_s,
        tooltip: '发现',
        label: ''),
    BottomNavigationBarItem(
        icon: MyIcons.feed,
        activeIcon: MyIcons.feed_s,
        tooltip: '订阅',
        label: ''),
    BottomNavigationBarItem(
        icon: MyIcons.person,
        activeIcon: MyIcons.person_s,
        tooltip: '我的',
        label: '')
  ];
  final List tabBodies = [
    BookShelfPage(),
    ExplorePage(),
    RssPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        // appBar: AppBar(
        //   // Here we take the value from the MyHomePage object that was created by
        //   // the App.build method, and use it to set our appbar title.
        //   title: Text(widget.title),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: bottomTabs,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body: Container(
          child: tabBodies[currentIndex],
        ));
  }
}
