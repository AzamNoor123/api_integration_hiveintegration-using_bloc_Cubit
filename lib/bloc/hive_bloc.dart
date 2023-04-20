import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:task_3_bloc/utills/helper/common_keys.dart';

part 'hive_event.dart';

part 'hive_state.dart';

class HiveBloc extends Bloc<HiveEvent, HiveState> {
  HiveBloc() : super(HiveInitial()) {
    on<ValueAdded>((event, emit) async {
      emit(LoadingState());
      Future.delayed(const Duration(seconds: 1));
      try {
        var box = await Hive.openBox(CommonKeys.hiveBoxKey);
        await box.put(CommonKeys.hiveBoxField, event.data);
        var name = box.get(CommonKeys.hiveBoxField);
        emit(DataAddState());
      } catch (e) {
        emit(HiveErrorState(e.toString()));
      }
    });
    on<ValueLoaded>((event, emit) async {
      emit(LoadingState());
      Future.delayed(Duration(seconds: 1));
      emit(DataLoadState());
      try {
        var box = await Hive.openBox(CommonKeys.hiveBoxKey);
        var key = box.get(CommonKeys.hiveBoxField);
        return key;
      } catch (e) {
        emit(HiveErrorState(e.toString()));
      }
    });
  }
}
