import 'package:flutter/material.dart';
import 'package:flutter_desktop_exapmle/application/member_provider.dart';
import 'package:flutter_desktop_exapmle/main_page.dart';
import 'package:flutter_desktop_exapmle/model/data_model.dart';
import 'package:flutter_desktop_exapmle/model/member.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MemberAdapter());
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>('data');
  await Hive.openBox<Member>('MEMBER');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MemberProvider()),
      ],
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
