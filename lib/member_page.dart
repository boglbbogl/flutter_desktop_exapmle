import 'package:flutter/material.dart';
import 'package:flutter_desktop_exapmle/app_size.dart';
import 'package:flutter_desktop_exapmle/application/member_provider.dart';
import 'package:flutter_desktop_exapmle/logger.dart';
import 'package:flutter_desktop_exapmle/member_create_widget.dart';
import 'package:flutter_desktop_exapmle/member_update_widget.dart';
import 'package:flutter_desktop_exapmle/model/member.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class MemberPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _storeController = TextEditingController();
  MemberPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<MemberProvider>(
      builder: (context, value, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            memberCreateWidget(context: context);
          },
          child: const Icon(Icons.add),
        ),
        body: ValueListenableBuilder(
          valueListenable: value.memberBox.listenable(),
          builder: (context, Box<Member> items, _) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  logger.d(index);
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: InkWell(
                      onTap: () {
                        _nameController.text =
                            items.values.toList()[index].name;
                        _positionController.text =
                            items.values.toList()[index].position.toString();
                        _storeController.text =
                            items.values.toList()[index].store;
                        memberUpdateWidget(
                            context: context,
                            name: _nameController,
                            position: _positionController,
                            store: _storeController,
                            index: index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromRGBO(155, 155, 155, 1)),
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Name : ${items.values.toList()[index].name}",
                                style: theme.textTheme.bodyText2!
                                    .copyWith(color: Colors.black),
                              ),
                              Text(
                                "Position : ${items.values.toList()[index].position}",
                                style: theme.textTheme.bodyText2!
                                    .copyWith(color: Colors.black),
                              ),
                              Text(
                                "Store : ${items.values.toList()[index].store}",
                                style: theme.textTheme.bodyText2!
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
            // return ListView(
            //   shrinkWrap: true,
            //   children: [
            //     ...items.values.map((e) => Padding(
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 16, vertical: 8),
            //           child: InkWell(
            //             onTap: () {
            //               _nameController.text = e.name;
            //               _positionController.text = e.position.toString();
            //               _storeController.text = e.store;
            //               memberUpdateWidget(
            //                 context: context,
            //                 name: _nameController,
            //                 position: _positionController,
            //                 store: _storeController,
            //                 index: items.keyAt(1)
            //               );
            //             },
            //             child: Container(
            //               decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(8),
            //                   color: const Color.fromRGBO(155, 155, 155, 1)),
            //               width: size.width,
            //               child: Padding(
            //                 padding: const EdgeInsets.all(16.0),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                   children: [
            //                     Text(
            //                       "Name : ${e.name}",
            //                       style: theme.textTheme.bodyText2!
            //                           .copyWith(color: Colors.black),
            //                     ),
            //                     Text(
            //                       "Position : ${e.position}",
            //                       style: theme.textTheme.bodyText2!
            //                           .copyWith(color: Colors.black),
            //                     ),
            //                     Text(
            //                       "Store : ${e.store}",
            //                       style: theme.textTheme.bodyText2!
            //                           .copyWith(color: Colors.black),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         )),
            //   ],
            // );

            // return ListView.separated(
            //   separatorBuilder: (_, index) => Divider(),
            //   itemCount: items.length,
            //   shrinkWrap: true,
            //   scrollDirection: Axis.vertical,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemBuilder: (_, index) {
            //     final int key = keys[index];
            //     final Member _member = items.get(key);
            //     return Card(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15.0),
            //       ),
            //       color: Colors.blueGrey[200],
            //       child: ListTile(
            //         title: Text(
            //           _member.name,
            //           style: TextStyle(fontSize: 22, color: Colors.black),
            //         ),
            //         subtitle: Text(_member.position.toString(),
            //             style: TextStyle(fontSize: 20, color: Colors.black38)),
            //         leading: Text(
            //           "$key",
            //           style: TextStyle(fontSize: 18, color: Colors.black),
            //         ),
            //         onTap: () {},
            //       ),
            //     );
            //   },
            // );
          },
        ),
      ),
    );
  }
}
