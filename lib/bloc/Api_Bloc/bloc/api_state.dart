part of 'api_bloc.dart';

abstract class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object> get props => [];
}

class ApiInitial extends ApiState {}

class ApiLoadingState extends ApiState {
  @override
  List<Object> get props => [];
}

class ApiLoadedState extends ApiState {
  final List<ApiModel> userlist;

  const ApiLoadedState(this.userlist);

  @override
  List<Object> get props => [userlist];
}

class ApiErrorState extends ApiState {
  final String error;

  const ApiErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class ApiLoading extends ApiState {}
