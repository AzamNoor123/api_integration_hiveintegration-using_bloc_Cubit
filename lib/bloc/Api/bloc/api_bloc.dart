import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:task_3_bloc/utills/helper/common_keys.dart';
import 'package:task_3_bloc/utills/helper/constant_resources.dart';

import '../../../Models/Api_model.dart';

part 'api_event.dart';

part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  List<ApiModel> apilist = [];
  List<ApiModel> newlist = [];

  ApiBloc() : super(ApiInitial()) {
    on<ApiLoad>((event, emit) async {
      emit(ApiLoading());

      Future.delayed(const Duration(seconds: ConsTResources.delay));
      const url = ConsTResources.apiUrl;
      final response = await http.get(Uri.parse(url));
      print(response.statusCode);
      var apibody = jsonDecode(response.body);
      List apidataList = apibody[CommonKeys.API_DATA_KEY].toList();
      for (var i = 0; i < apidataList.length; i++) {
        var model = ApiModel(
            name: apidataList[i][CommonKeys.NAME_YEY],
            avater: apidataList[i][CommonKeys.AVATAR_KEY]);
        apilist.add(model);
      }
      emit(ApiLoadedState(apilist));
    });
    on<ApiSort>((event, emit) {
      emit(ApiLoading());

      try {
        newlist = apilist
            .where((element) => element.name.contains(event.fieldtext))
            .toList();
        emit(ApiLoadedState(newlist));
      } catch (e) {
        emit(ApiErrorState(e.toString()));
      }
    });
  }
}
