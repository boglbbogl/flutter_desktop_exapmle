import 'package:hive/hive.dart';

part 'member.g.dart';

@HiveType(typeId: 1)
class Member {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int position;
  @HiveField(2)
  final String store;

  Member(this.name, this.position, this.store);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _map = {};
    _map['name'] = name;
    _map['position'] = position;
    _map['store'] = store;
    return _map;
  }
}
