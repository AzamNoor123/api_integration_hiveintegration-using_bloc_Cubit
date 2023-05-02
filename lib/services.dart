import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_3_bloc/Models/Api_model.dart';
import 'package:task_3_bloc/utills/helper/constant_resources.dart';

class Services {
  List<ApiModel> apilist = [];
  List<ApiModel> newlist = [];

  static Uploading(userdata) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection(ConsTResources.db)
        .doc()
        .set({ConsTResources.db_field: userdata});
  }
}
