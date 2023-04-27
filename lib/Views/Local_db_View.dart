import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_3_bloc/bloc/hive_bloc.dart';
import 'package:task_3_bloc/bloc/hivemodel.dart';
import 'package:task_3_bloc/utills/CustomTextField.dart';
import 'package:task_3_bloc/utills/helper/Dimension.dart';
import 'package:task_3_bloc/utills/helper/Snakbar_extension.dart';
import 'package:task_3_bloc/utills/helper/String_extension.dart';
import 'package:task_3_bloc/utills/helper/Widgets_extension.dart';
import 'package:task_3_bloc/utills/helper/common_keys.dart';
import 'package:task_3_bloc/utills/helper/constant_resources.dart';
import 'package:task_3_bloc/utills/helper/custom_extension.dart';

class LocalDbView extends StatefulWidget {
  const LocalDbView({Key? key}) : super(key: key);

  @override
  State<LocalDbView> createState() => _LocalDbViewState();
}

class _LocalDbViewState extends State<LocalDbView> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    context.read<HiveBloc>().add(const ValueLoaded());
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> field = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConsTResources.localDbView),
        centerTitle: true,
      ),
      body: BlocConsumer<HiveBloc, HiveState>(
        listener: (context, state) {
          if (state is DataAddState) {}
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: field,
                  child: customTextField(
                    name: ConsTResources.text.captilize,
                    hint: ConsTResources.hint.captilize,
                    controller: _textEditingController,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (field.currentState!.validate()) {
                      context.read<HiveBloc>().add(
                          ValueAdded(data: User(_textEditingController.text)));
                      ScaffoldMessenger.of(context)
                          .custmSnakeBar(ConsTResources.snakBarMsg);
                      _textEditingController.clear();
                    } else {
                      return null;
                    }
                  },
                  child: Text(ConsTResources.submitBtn.captilize),
                ),
                SizedBox(
                  height: context.CT_height * DimenResource.D_0_1,
                ),
                BlocBuilder<HiveBloc, HiveState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      context.read<HiveBloc>().add(const ValueLoaded());
                    }
                    if (state is DataLoadState) {
                      if (state.data.isNotEmpty) {
                        return SizedBox(
                          height: double.maxFinite,
                          child: Column(
                            children: [
                              Expanded(
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: state.data.length,
                                      itemBuilder: (context, i) {
                                        return ListTile(
                                          tileColor: Colors.pinkAccent,
                                          title: Text(state.data[i].name),
                                        ).padding(EdgeInsets.all(10));
                                      }))
                            ],
                          ),
                        );
                      }
                    }
                    return const Text('No data Found');
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
