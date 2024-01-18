import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    mainPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Бизнес',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Образование',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  Padding mainPage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 393,
            height: 52,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffd9d9d9)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Поиск",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      )),
                  Image.asset(
                    "assets/icons8-поиск-50 2.png",
                    width: 35,
                    height: 35,
                  ),
                ]),
          ),
          Text("Категории",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              )),
          Container(
              width: 393,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffd0d0ff)),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons8-университет-48 1.png",
                    width: 64,
                    height: 64,
                  ),
                  Text("Университеты",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              )),
          Container(
            width: 393,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffacacf9)),
            child: Row(children: [
              Image.asset(
                "assets/icons8-университет-48 2.png",
                width: 64,
                height: 64,
              ),
              Text("Предметы",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  )),
            ]),
          ),
          Container(
            width: 393,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff8282da)),
            child: Row(children: [
              Image.asset(
                "assets/icons8-университет-48 3.png",
                width: 75,
                height: 75,
              ),
              Text("Виды работ",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  )),
            ]),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Image.asset(
              "assets/icons8-пользователь-мужчина-в-кружке-96 1.png",
              width: 45,
              height: 45,
            ),
            Image.asset(
              "assets/icons8-главная-50 1.png",
              width: 45,
              height: 45,
            ),
            Image.asset(
              "assets/icons8-сообщение-в-чате-50 1.png",
              width: 45,
              height: 45,
            ),
          ]),
        ],
      ),
    );
  }
}
