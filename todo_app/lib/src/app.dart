import 'package:flutter/material.dart';

import 'package:todo_app/src/screens/wrapper.dart';
import 'package:todo_app/src/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
      theme: appTheme(),
    );
  }
}
