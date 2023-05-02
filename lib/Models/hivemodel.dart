import 'package:hive/hive.dart';

part 'hivemodel.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  final String name;

  User(this.name);

  set data(String data) {}
}
