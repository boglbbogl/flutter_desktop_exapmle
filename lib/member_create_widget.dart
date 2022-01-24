import 'package:flutter/material.dart';
import 'package:flutter_desktop_exapmle/app_size.dart';
import 'package:provider/provider.dart';
import 'package:flutter_desktop_exapmle/application/member_provider.dart';

Future memberCreateWidget({
  required BuildContext context,
}) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              _textForm(
                  title: '이름',
                  onChanged: (value) {
                    context.read<MemberProvider>().getName(value: value);
                  }),
              _textForm(
                  title: '직급',
                  onChanged: (value) {
                    context
                        .read<MemberProvider>()
                        .getPosition(value: int.parse(value));
                  }),
              _textForm(
                  title: '지점',
                  onChanged: (value) {
                    context.read<MemberProvider>().getStore(value: value);
                  }),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue),
                child: InkWell(
                  onTap: () {
                    context
                        .read<MemberProvider>()
                        .savedMember(context: context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 12),
                    child: Text(
                      '추가하기',
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      });
}

Padding _textForm({
  required String title,
  required Function(String) onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyText2!
              .copyWith(color: const Color.fromRGBO(115, 115, 115, 1)),
        ),
        SizedBox(
            width: size.width * 0.3,
            height: size.height * 0.07,
            child: TextFormField(
              onChanged: onChanged,
            )),
      ],
    ),
  );
}
