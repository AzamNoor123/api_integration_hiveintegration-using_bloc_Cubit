part of 'hive_bloc.dart';

abstract class HiveState extends Equatable {
  const HiveState();

  @override
  List<Object> get props => [];
}

class HiveInitial extends HiveState {}

class HiveErrorState extends HiveState {
  final error;

  const HiveErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class DataAddState extends HiveState {
  @override
  List<Object> get props => [];
}

class DataLoadState extends HiveState {
  @override
  List<Object> get props => [];
}

class LoadingState extends HiveState {
  @override
  List<Object> get props => [];
}
