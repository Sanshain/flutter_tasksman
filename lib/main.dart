import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Some Awesome App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(title: 'The Tasks'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => MainPageState();
}

// ignore: use_key_in_widget_constructors
class UsersList extends StatefulWidget {
  const UsersList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MainPageState createState() => MainPageState();
}


class MainPageState extends State<MainPage> {
  int _counter = 0;
  int selectedIndex = -1;
  final List<String> users = [
    "Tom", "Alice", "Sam", "Bob", "Kate",
    "Tom", "Alice", "Sam", "Bob", "Kate",
    "Tom", "Alice", "Sam", "Bob", "Kate"
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
                '$_counter (selected $selectedIndex)',
                style: Theme.of(context).textTheme.headline6,
              )
          ),
          Expanded(child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: users.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    onTap: () => setState(() => selectedIndex = index),
                    title: Text(users[index], style: const TextStyle(fontSize: 22)),
                    leading: const Icon(Icons.face),
                    trailing: const Icon(Icons.phone),
                    tileColor: index == selectedIndex ? Colors.black12: Colors.white60,
                    subtitle: Text("Works in ${users[index]}")
                );
              }
          ))
        ],
      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            const Text(
//              'You have pushed the button this many times 5:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
//            ),
//          ],
//        ),
//      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.accessibility),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
