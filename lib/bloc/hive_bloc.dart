import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:task_3_bloc/utills/helper/constant_resources.dart';

import '../Models/hivemodel.dart';

part 'hive_event.dart';

part 'hive_state.dart';

class HiveBloc extends Bloc<HiveEvent, HiveState> {
  HiveBloc() : super(HiveInitial()) {
    Box<User> boxdata;
    List<User> data = [];

    on<ValueAdded>((event, emit) async {
      emit(LoadingState());
      Future.delayed(const Duration(seconds: ConsTResources.delay));
      try {
        final box = Boxes.getData();
        box.add(event.data);
        add(const ValueLoaded());
      } catch (e) {
        emit(HiveErrorState(e.toString()));
        print(e);
      }
    });

    on<ValueLoaded>((event, emit) async {
      emit(LoadingState());
      Future.delayed(const Duration(seconds: 1));

      try {
        boxdata = Boxes.getData();
        data = boxdata.values.toList();
        emit(DataLoadState(data: data));
      } catch (e) {
        emit(HiveErrorState(e.toString()));
        print(e);
      }
    });
  }
}

class Boxes {
  static Box<User> getData() => Hive.box<User>(ConsTResources.hiveBoxKey);
}
