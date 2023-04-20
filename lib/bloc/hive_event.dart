part of 'hive_bloc.dart';

abstract class HiveEvent extends Equatable {
  const HiveEvent();

  @override
  List<Object> get props => [];
}

class ValueAdded extends HiveEvent {
  final String data;

  const ValueAdded(this.data);
}

class ValueLoaded extends HiveEvent {
  const ValueLoaded();

  @override
  List<Object> get props => [];
}
