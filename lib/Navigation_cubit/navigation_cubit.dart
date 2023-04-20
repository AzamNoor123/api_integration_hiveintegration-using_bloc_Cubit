import 'package:flutter_bloc/flutter_bloc.dart';

import '../Views/root.dart';
import 'cubit_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.api, 1));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.firebase:
        emit(NavigationState(NavbarItem.firebase, 0));
        break;
      case NavbarItem.api:
        emit(NavigationState(NavbarItem.api, 1));
        break;
      case NavbarItem.localdb:
        emit(NavigationState(NavbarItem.localdb, 2));
        break;
    }
  }
}
