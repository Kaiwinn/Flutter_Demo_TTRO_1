import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  String name;
  int age;
  MyApp({required this.name, required this.age});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print('run initState');
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print('run dispose');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print('App is in Background mode');
    } else if (state == AppLifecycleState.resumed) {
      print('App is in Foreground mode');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('run Build');
    return MaterialApp(
        title: 'This is my sceen',
        home: Scaffold(
            body: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("thisnewscreen+ ${widget.name}+ ${widget.age}",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 14, color: Colors.red)),
            Text("Abc+ ${widget.name}+ ${widget.age}",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 14, color: Colors.blue))
          ],
        ))));
  }
}
