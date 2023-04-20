import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_3_bloc/services.dart';

part 'firebase_event.dart';

part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  FirebaseBloc() : super(FirebaseInitial()) {
    on<UploadData>((event, emit) {
      emit(FirebaseLoading());
      Future.delayed(const Duration(seconds: 1));
      try {
        Services.Uploading(event.userdata);
        print(event.userdata);
        emit(const FirebaseDataUploaded());
      } catch (e) {
        emit(FirebaseError(e.toString()));
      }
    });
  }
}
