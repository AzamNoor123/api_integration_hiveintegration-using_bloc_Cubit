part of 'api_bloc.dart';

abstract class ApiEvent extends Equatable {
  const ApiEvent();

  @override
  List<Object> get props => [];
}

class ApiLoad extends ApiEvent {
  @override
  List<Object> get props => [];
}

class ApiSort extends ApiEvent {
  final String fieldtext;

  const ApiSort(this.fieldtext);

  @override
  List<Object> get props => [fieldtext];
}
