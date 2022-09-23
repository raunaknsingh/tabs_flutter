import 'package:flutter/material.dart';
import 'package:tabs_flutter/firstpage.dart';
import 'package:tabs_flutter/secondpage.dart';
import 'package:tabs_flutter/thirdpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab ${controller.index + 1}'),
        bottom: TabBar(
          controller: controller,
          tabs: const [
            Tab(
              text: 'Tab 1',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Tab 2',
              icon: Icon(Icons.star),
            ),
            Tab(
              text: 'Tab 3',
              icon: Icon(Icons.person),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          FirstPage(),
          SecondPage(),
          ThirdPage(),
        ],
      ),
    );
  }
}
