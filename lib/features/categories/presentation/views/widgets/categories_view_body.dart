import 'package:flutter/material.dart';
import 'package:graduation/features/categories/presentation/views/widgets/cat_grid.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CategoriesGrid());
  }
}
