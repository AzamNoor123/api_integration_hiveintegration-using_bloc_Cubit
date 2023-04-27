import 'package:hive/hive.dart';
import 'package:task_3_bloc/bloc/hivemodel.dart';
import 'package:task_3_bloc/utills/helper/common_keys.dart';

class Boxes {
  static Box<User> getData() => Hive.box<User>(CommonKeys.hiveBoxKey);
}
