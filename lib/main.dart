import 'package:flutter/material.dart';
import 'page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'ตัวอย่าง TabBar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        bottom: TabBar(
          labelColor: Color(0xffffffff),
          unselectedLabelColor: Color(0x55ffffff),
          tabs: <Tab>[
            Tab(icon: Icon(Icons.home), text: 'หน้า 1'),
            Tab(icon: Icon(Icons.book), text: 'หน้า 2'),
            Tab(icon: Icon(Icons.more), text: 'หน้า 3'),
          ],
          controller: controller,
        ),
      ),
      body: TabBarView(
        children: <Widget>[MyPage(title:'หน้า 1'), MyPage(title:'หน้า 2'), MyPage(title:'หน้า 3')],
        controller: controller,
      ),
    );
  }
}
