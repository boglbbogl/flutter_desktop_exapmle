import 'package:flutter/material.dart';
import 'package:flutter_desktop_exapmle/app_size.dart';
import 'package:flutter_desktop_exapmle/application/person_provider.dart';
import 'package:provider/provider.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: context.watch<PersonProvider>().isSavedLoading
          ? CircularProgressIndicator()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textForm(
                    title: '이름',
                    onChanged: (value) {
                      context.read<PersonProvider>().getName(value: value);
                    }),
                _textForm(
                    title: '직급',
                    onChanged: (value) {
                      context
                          .read<PersonProvider>()
                          .getPosition(value: int.parse(value));
                    }),
                _textForm(
                    title: '지점',
                    onChanged: (value) {
                      context.read<PersonProvider>().getStore(value: value);
                    }),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () async {
                      context.read<PersonProvider>().savedPerson();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          '저장하기',
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }

  Padding _textForm({
    required String title,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
              height: size.height * 0.08,
              child: TextFormField(
                onChanged: onChanged,
              )),
        ],
      ),
    );
  }
}
