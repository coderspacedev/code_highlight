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
