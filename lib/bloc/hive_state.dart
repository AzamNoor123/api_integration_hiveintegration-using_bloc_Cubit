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
  final List<User> data;
  const DataLoadState({required this.data});

  @override
  List<Object> get props => [data];
}

class LoadingState extends HiveState {
  @override
  List<Object> get props => [];
}
