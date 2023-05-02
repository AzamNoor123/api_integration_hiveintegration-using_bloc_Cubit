import 'package:flutter/material.dart';
import 'package:task_3_bloc/utills/helper/Dimension.dart';
import 'package:task_3_bloc/utills/helper/custom_extension.dart';

import '../helper/constant_resources.dart';
import '../helper/string_resources.dart';

class Bottom_Navigation_Bar extends StatefulWidget {
  const Bottom_Navigation_Bar({
    super.key,
  });

  @override
  State<Bottom_Navigation_Bar> createState() => _Bottom_Navigation_BarState();
}

class _Bottom_Navigation_BarState extends State<Bottom_Navigation_Bar> {
  @override
  Widget build(BuildContext context) {
    var selected = 0;

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              ConsTResources.firebase_image,
              height: context.CT_height * DimenResource.D_0_5,
              width: context.CT_width * DimenResource.D_0_5,
            ),
            label: StringResources.firebaseLabel),
        BottomNavigationBarItem(
            icon: Image.asset(
              ConsTResources.api_image,
              height: context.CT_height * DimenResource.D_0_5,
              width: context.CT_width * DimenResource.D_0_5,
            ),
            label: StringResources.apiLabel),
        BottomNavigationBarItem(
            icon: Image.asset(
              ConsTResources.localdb_image,
              height: context.CT_height * DimenResource.D_0_5,
              width: context.CT_width * DimenResource.D_0_5,
            ),
            label: StringResources.localDblabel)
      ],
    );
  }
}
