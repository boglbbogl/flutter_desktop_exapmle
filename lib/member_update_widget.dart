import 'package:flutter/material.dart';
import 'package:flutter_desktop_exapmle/application/member_provider.dart';
import 'package:flutter_desktop_exapmle/logger.dart';
import 'package:provider/provider.dart';

Future memberUpdateWidget({
  required BuildContext context,
  required TextEditingController name,
  required TextEditingController position,
  required TextEditingController store,
  required int index,
}) {
  logger.e(index);
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                ),
                TextFormField(
                  controller: position,
                ),
                TextFormField(
                  controller: store,
                ),
                const SizedBox(height: 20),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue),
                    child: InkWell(
                      onTap: () {
                        context.read<MemberProvider>().updateMember(
                            name: name.text,
                            position: position.text,
                            store: store.text,
                            index: index,
                            context: context);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        child: Text('수정하기'),
                      ),
                    ))
              ],
            ),
          ),
        );
      });
}
