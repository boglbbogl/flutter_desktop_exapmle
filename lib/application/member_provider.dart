import 'package:flutter/material.dart';
import 'package:flutter_desktop_exapmle/logger.dart';
import 'package:flutter_desktop_exapmle/model/member.dart';
import 'package:hive/hive.dart';

class MemberProvider extends ChangeNotifier {
  String _name = "";
  int _position = 1;
  String _store = "";
  final Box<Member> _memberBox = Hive.box<Member>("MEMBER");

  void updateMember({
    required String name,
    required String position,
    required String store,
    required int index,
    required BuildContext context,
  }) {
    _memberBox.putAt(index, Member(name, int.parse(position), store));
    Navigator.of(context).pop();
  }

  void savedMember({
    required BuildContext context,
  }) {
    // final _box = Hive.box('MEMBER');
    _memberBox.add(Member(_name, _position, _store));
    logger.e(_memberBox.values);
    Navigator.of(context).pop();
  }

  void getName({
    required String value,
  }) {
    _name = value;
    notifyListeners();
  }

  void getPosition({
    required int value,
  }) {
    _position = value;
    notifyListeners();
  }

  void getStore({
    required String value,
  }) {
    _store = value;
    notifyListeners();
  }

  String get name => _name;
  int get position => _position;
  String get store => _store;
  Box<Member> get memberBox => _memberBox;
}
