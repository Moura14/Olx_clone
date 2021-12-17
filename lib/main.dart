import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/repositories/category_respository.dart';
import 'package:olx_mobx/screens/base/base_screen.dart';
import 'package:olx_mobx/screens/category/category_screens.dart';
import 'package:olx_mobx/stores/category_store.dart';
import 'package:olx_mobx/stores/page_store.dart';
import 'package:olx_mobx/stores/user_menage_stores.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserMenageStore());
  GetIt.I.registerSingleton(CategoryStore());
}

Future<void> initializeParse() async {
  await Parse().initialize("72oW8kqzMKNlVVAIzZFAKxENlZiaGIDr5r4LSAzQ",
      "https://parseapi.back4app.com/",
      clientKey: "DWGpSrVo203jah19aiN3YIOuYIQUScMKgLzYo1Cf",
      autoSendSessionId: true,
      debug: true);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'OLX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.purple,
            scaffoldBackgroundColor: Colors.purple,
            appBarTheme: AppBarTheme(elevation: 0),
            cursorColor: Colors.orange),
        home: BaseScreen());
  }
}
