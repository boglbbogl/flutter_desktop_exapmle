import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int position;
  @HiveField(3)
  final String store;

  Person(this.name, this.position, this.store);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _map = {};
    _map['name'] = name;
    _map['position'] = position;
    _map['store'] = store;
    return _map;
  }
}
