import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_3_bloc/Navigation_cubit/navigation_cubit.dart';
import 'package:task_3_bloc/Views/root.dart';
import 'package:task_3_bloc/bloc/Api_Bloc/bloc/api_bloc.dart';
import 'package:task_3_bloc/bloc/Firebase_bloc/firebase_bloc.dart';
import 'package:task_3_bloc/bloc/hive_bloc.dart';
import 'package:task_3_bloc/utills/helper/common_keys.dart';
import 'package:task_3_bloc/utills/helper/constant_resources.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var appDocumentsDir = await getApplicationDocumentsDirectory();

  await Hive.initFlutter();
  Hive.init(appDocumentsDir.path);
  await Hive.openBox(CommonKeys.hiveBoxKey);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => ApiBloc(),
        ),
        BlocProvider(
          create: (context) => HiveBloc(),
        ),
        BlocProvider(
          create: (context) => FirebaseBloc(),
        )
      ],
      child: MaterialApp(
        title: ConsTResources.taskName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RootScreen(),
      ),
    );
  }
}
