import 'package:flutter/material.dart';

void main() {
  // アプリの起動ポイント。Flutterフレームワークにルートウィジェットを渡す。
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // テーマ全体のベースカラーを設定。seedColorを変えると配色が一括で変わる。
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // UIに表示するカウンター値。setStateで更新すると画面が再描画される。
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // 状態の変更を通知することでbuildメソッドが再実行され、最新の値が反映される。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 状態が更新されるたびに呼び出され、現在の状態に基づいてUIを構築する。
    return Scaffold(
      appBar: AppBar(
        // テーマから色を取得。テーマ変更時に自動で色が切り替わる。
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // 親ウィジェットから受け取ったタイトルをAppBarに表示。
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // 中央寄せの縦並びレイアウトで、テキストとカウンター値を表示。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 右下の+ボタン。押下時にカウンターを増やす。
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // 末尾のカンマにより自動整形時の差分が最小限になる。
    );
  }
}
