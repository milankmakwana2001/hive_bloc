import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_bloc/business_logic/blocs/user_bloc/user_bloc.dart';
import 'package:hive_bloc/business_logic/repository/user_local_db_repo.dart';
import 'package:hive_bloc/presentation/screens/user_list_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserLocalDBRepo(),
      child: BlocProvider<UserBloc>(
        create: (context) => UserBloc(
          userLocalDBRepo: RepositoryProvider.of<UserLocalDBRepo>(context),
        )..add(DBInitEvent()),
        child: MaterialApp(
          title: 'Hive local DB with Bloc',
          routes: {
            UserListScreen.pageRoute: (context) => UserListScreen(),
          },
          home: HomeScreen(),
        ),
      ),
    );
  }
}
