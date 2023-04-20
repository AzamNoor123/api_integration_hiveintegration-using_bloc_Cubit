import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:task_3_bloc/bloc/Api_Bloc/ApiModel.dart';

class Services {
  List<ApiModel> apilist = [];
  List<ApiModel> newlist = [];

  static Uploading(userdata) async {
    print('uploading...');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('DbUser').doc().set({'user': userdata});
    print('uploaded');
  }

  static apiLoading() async {
    const url = 'https://reqres.in/api/users';
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    var apibody = jsonDecode(response.body);
    List apidata_list = apibody['data'].toList();
    print(apidata_list[1]['email']);
    for (var i = 0; i < apidata_list.length; i++) {
      var model = ApiModel(
          name: apidata_list[i]['first_name'],
          avater: apidata_list[i]['avatar']);
    }
  }
}
