import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopsocks/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Step 3
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(App()));
}
