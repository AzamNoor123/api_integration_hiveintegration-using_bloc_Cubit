import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_3_bloc/Models/Api_model.dart';
import 'package:task_3_bloc/utills/helper/Dimension.dart';
import 'package:task_3_bloc/utills/helper/String_extension.dart';
import 'package:task_3_bloc/utills/helper/Widgets_extension.dart';
import 'package:task_3_bloc/utills/helper/constant_resources.dart';
import 'package:task_3_bloc/utills/helper/custom_extension.dart';
import 'package:task_3_bloc/utills/helper/string_resources.dart';

import '../bloc/Api/bloc/api_bloc.dart';
import '../utills/CustomTextField.dart';

class ApiView extends StatefulWidget {
  const ApiView({super.key});

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<ApiBloc>(context).add(ApiLoad());

    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> key2 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringResources.apiView.captilize),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: key2,
                child: customTextField(
                  name: StringResources.text.captilize,
                  hint: StringResources.hint.captilize,
                  controller: _textEditingController,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (key2.currentState?.validate() ?? false) {
                    BlocProvider.of<ApiBloc>(context)
                        .add(ApiSort(_textEditingController.text.captilize));
                  }
                },
                child: Text(StringResources.searchBtn.captilize),
              ),
              SizedBox(
                  height: context.CT_height * DimenResource.D_0_5,
                  child: BlocBuilder<ApiBloc, ApiState>(
                    builder: (context, state) {
                      if (state is ApiLoading) {
                        return const CircularProgressIndicator().centerwidget;
                      }
                      if (state is ApiErrorState) {
                        return Text(state.error);
                      }
                      if (state is ApiLoadedState) {
                        List<ApiModel> datalist = state.userlist;
                        return ListView.builder(
                            itemCount: datalist.length,
                            itemBuilder: (context, Index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  foregroundImage: NetworkImage(
                                      datalist[Index].avater.toString()),
                                ),
                                title: Text(datalist[Index].name),
                              );
                            });
                      }
                      return Text(StringResources.dataNotFound.captilize);
                    },
                  )),
            ],
          ),
        ));
  }
}
