import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_3_bloc/Views/Api_view.dart';
import 'package:task_3_bloc/Views/Firebase_View.dart';
import 'package:task_3_bloc/Views/Local_db_View.dart';
import 'package:task_3_bloc/utills/helper/custom_extension.dart';

import '../Navigation_cubit/cubit_state.dart';
import '../Navigation_cubit/navigation_cubit.dart';
import '../utills/helper/constant_resources.dart';

enum NavbarItem { firebase, api, localdb }

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConsTResources.taskName),
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    ConsTResources.firebase_image,
                    height: context.CT_height * .05,
                    width: context.CT_width * .05,
                  ),
                  label: ConsTResources.firebaseLabel),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    ConsTResources.api_image,
                    height: context.CT_height * .05,
                    width: context.CT_width * .05,
                  ),
                  label: ConsTResources.apiLabel),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    ConsTResources.localdb_image,
                    height: context.CT_height * .05,
                    width: context.CT_width * .05,
                  ),
                  label: ConsTResources.localDblabel)
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.firebase);
              } else if (index == 1) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.api);
              } else if (index == 2) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.localdb);
              }
            },
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.firebase) {
          return FirebaseView();
        } else if (state.navbarItem == NavbarItem.api) {
          return ApiView();
        } else if (state.navbarItem == NavbarItem.localdb) {
          return const LocalDbView();
        }
        return Container();
      }),
    );
  }
}
