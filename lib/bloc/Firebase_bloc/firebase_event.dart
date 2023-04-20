part of 'firebase_bloc.dart';

abstract class FirebaseEvent extends Equatable {
  const FirebaseEvent();

  @override
  List<Object> get props => [];
}

class UploadData extends FirebaseEvent {
  final String userdata;

  const UploadData(this.userdata);

  @override
  List<Object> get props => [userdata];
}

class DownLoadData extends FirebaseEvent {
  @override
  List<Object> get props => [];
}
