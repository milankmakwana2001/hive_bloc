import 'package:flutter/material.dart';
import 'package:hive_bloc/core/app_strings.dart';
import 'package:hive_bloc/models/user.dart';
import 'presentation/screens/home_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Hive local DB with Bloc',
      home: HomeScreen(),
    );
  }
}
