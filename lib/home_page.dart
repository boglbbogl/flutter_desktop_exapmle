import 'package:flutter/material.dart';
import 'package:flutter_desktop_exapmle/model/person.dart';
import 'package:hive_flutter/adapters.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder(
          valueListenable: Hive.box<Person>('PERSON').listenable(),
          builder: (context, Box<Person> box, child) {
            // return Container();
            return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final _person = box.get(index + 1);
                  if (_person == null) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber,
                    );
                  }
                  return Column(
                    children: [
                      Text(_person.name),
                    ],
                  );
                });
          }),
    );
  }
}
