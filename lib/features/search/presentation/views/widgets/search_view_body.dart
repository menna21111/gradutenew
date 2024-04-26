import 'package:flutter/material.dart';
import 'package:graduation/core/widgets/appbar.dart';
import 'package:graduation/features/search/presentation/views/widgets/gridsearchresult.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SearhResultGrid(),
    );
  }
}
