import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test_app/injection_container.dart' as di;
import 'package:path_provider/path_provider.dart';
import 'package:test_app/presentation/cubit/list_users/list_users_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/presentation/screens/list_users_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Hive..init(await (await getApplicationDocumentsDirectory()).path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<ListUsersCubit>()..getUsers(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(backgroundColor: Color(0xff2B2E4A)),
        color: Colors.red,
        home: ListUsersScreen(),
      ),
    );

  }
}

