part of 'firebase_bloc.dart';

abstract class FirebaseState extends Equatable {
  const FirebaseState();

  @override
  List<Object> get props => [];
}

class FirebaseInitial extends FirebaseState {}

class FirebaseLoading extends FirebaseState {
  @override
  List<Object> get props => [];
}

class FirebaseError extends FirebaseState {
  final String error;

  const FirebaseError(this.error);

  @override
  List<Object> get props => [error];
}

class FirebaseDataUploaded extends FirebaseState {
  const FirebaseDataUploaded();

  @override
  List<Object> get props => [];
}
