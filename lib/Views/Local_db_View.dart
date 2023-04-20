import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_3_bloc/bloc/hive_bloc.dart';
import 'package:task_3_bloc/utills/CustomTextField.dart';
import 'package:task_3_bloc/utills/helper/Dimension.dart';
import 'package:task_3_bloc/utills/helper/Snakbar_extension.dart';
import 'package:task_3_bloc/utills/helper/String_extension.dart';
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
    Hive.openBox(CommonKeys.hiveBoxKey);
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
          if (state is DataAddState) {
            ScaffoldMessenger.of(context)
                .custmSnakeBar(ConsTResources.snakBarMsg);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                customTextField(
                  name: ConsTResources.text.captilize,
                  hint: ConsTResources.hint.captilize,
                  controller: _textEditingController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    BlocProvider.of<HiveBloc>(context)
                        .add(ValueAdded(_textEditingController.text));
                    _textEditingController.clear();
                    await Future.delayed(const Duration(seconds: 2));
                    BlocProvider.of<HiveBloc>(context).add(
                      const ValueLoaded(),
                    );
                  },
                  child: Text(ConsTResources.submitBtn.captilize),
                ),
                SizedBox(
                  height: context.CT_height * DimenResource.D_0_1,
                ),
                ValueListenableBuilder(
                  valueListenable: Hive.box(CommonKeys.hiveBoxKey).listenable(),
                  builder: (context, box, child) {
                    if (box.isEmpty) {
                      return Text(ConsTResources.dataNotFound.captilize);
                    } else {
                      return Text(box.get(CommonKeys.hiveBoxField));
                    }
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
