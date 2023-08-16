import 'package:app_educacao_financeira/app/routes/app_routes.dart';
import 'package:app_educacao_financeira/app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';

import 'app/view/simulador.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  await dotenv.load();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        AppRouter.LOGIN: (_) => LoginPage(),
      },
    );
  }
}
