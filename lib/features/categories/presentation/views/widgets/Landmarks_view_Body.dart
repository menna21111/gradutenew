import 'package:flutter/material.dart';
import 'package:graduation/core/widgets/appbar.dart';

import 'landmark_grid.dart';

class LandmarksBody extends StatelessWidget {
  const LandmarksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CustomAppBar(), body: LandMarkGrid());
  }
}
