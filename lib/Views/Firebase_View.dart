import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_3_bloc/bloc/Firebase_bloc/firebase_bloc.dart';
import 'package:task_3_bloc/utills/helper/Dimension.dart';
import 'package:task_3_bloc/utills/helper/Snakbar_extension.dart';
import 'package:task_3_bloc/utills/helper/String_extension.dart';
import 'package:task_3_bloc/utills/helper/Widgets_extension.dart';
import 'package:task_3_bloc/utills/helper/common_keys.dart';
import 'package:task_3_bloc/utills/helper/constant_resources.dart';
import 'package:task_3_bloc/utills/helper/custom_extension.dart';

import '../utills/CustomTextField.dart';

class FirebaseView extends StatefulWidget {
  @override
  _FirebaseViewState createState() => _FirebaseViewState();
}

class _FirebaseViewState extends State<FirebaseView> {
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ConsTResources.firebaseView.captilize),
        centerTitle: true,
      ),
      body: SizedBox(
        height: context.CT_height * DimenResource.D_900,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _key,
                child: customTextField(
                  name: ConsTResources.text.captilize,
                  hint: ConsTResources.hint.captilize,
                  controller: _textEditingController,
                ),
              ),
              BlocListener<FirebaseBloc, FirebaseState>(
                listener: (context, state) {
                  if (state is FirebaseDataUploaded) {
                    ScaffoldMessenger.of(context)
                        .custmSnakeBar(ConsTResources.snakBarMsg.captilize);
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      BlocProvider.of<FirebaseBloc>(context).add(
                        UploadData(_textEditingController.text),
                      );
                      _textEditingController.clear();
                    } else {
                      return null;
                    }
                  },
                  child: const Text(ConsTResources.submitBtn),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection(CommonKeys.dbKeys)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return SizedBox(
                    height: 300,
                    width: context.CT_width * DimenResource.D_400,
                    child: ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        return Text("${snapshot.data?.docs[index]['user']}");
                      },
                    ),
                  ).padding();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
