part of 'hive_bloc.dart';

abstract class HiveEvent extends Equatable {
  const HiveEvent();

  @override
  List<Object> get props => [];
}

class ValueAdded extends HiveEvent {
  final User data;

  const ValueAdded({required this.data});
  @override
  List<Object> get props => [data];
}

class ValueLoaded extends HiveEvent {
  const ValueLoaded();

  @override
  List<Object> get props => [];
}
