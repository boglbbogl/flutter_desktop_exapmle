import 'package:flutter/material.dart';
import 'package:flutter_desktop_exapmle/application/person_provider.dart';
import 'package:flutter_desktop_exapmle/main_page.dart';
import 'package:flutter_desktop_exapmle/model/data_model.dart';
import 'package:flutter_desktop_exapmle/model/person.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  // Hive.registerAdapter(PersonAdapter());
  // await Hive.openBox<Person>('person');
  Hive.registerAdapter(DataModelAdapter());

  await Hive.openBox<DataModel>('data');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PersonProvider()),
      ],
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
