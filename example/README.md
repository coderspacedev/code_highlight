# code_highlight

A code_highlight is a plugin for highlight code syntex from code write in string.

There are number of language and themes supported you can just import plugin to your flutter app and implement your code in flutter.

Supported Platforms:
    1. Android
    2. iOS
    3. Web

## 1. Add dependencies to your project

In your project go to pubspec.yaml and look for dependencies. Under dependencies, add the latest version of code_highlight (use the right numbers from Pub).
```dart
dependencies:
  code_highlight: ^[latest_version]
```

## How to implement
```dart
import 'package:code_highlight/code_highlight.dart';
import 'package:code_highlight/themes/androidstudio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var code = '''
import 'package:flutter/material.dart';

void main() {
  runApp(TechHuntApp());
}

class TechHuntApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: Center(
        child: Text('Hello World')
      ),
    );
  }
}
''';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        canvasColor: Colors.transparent,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Code Highlight'),
          elevation: 0,
          backgroundColor: Colors.blueAccent,
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.blueAccent,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: HighlightView(
                code,
                language: 'dart',
                theme: androidstudioTheme,
                padding: const EdgeInsets.all(24),
                textStyle: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```

## Support
For support, email techhuntdevelopers@gmail.com